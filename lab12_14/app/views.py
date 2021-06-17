from flask import render_template, Response, redirect, send_file
from flask_appbuilder.models.sqla.interface import SQLAInterface
from flask_appbuilder import ModelView, ModelRestApi
from flask_appbuilder.actions import action
from dict2xml import dict2xml
from docx import Document
from io import BytesIO
from .models import *

from . import appbuilder, db, excel

class GroupView(ModelView):
    datamodel = SQLAInterface(Group)
    list_columns = ['code']

appbuilder.add_view(
        GroupView,
        "Группы",
        icon="fa-folder-open-o"
)

class StudentView(ModelView):
    datamodel = SQLAInterface(Student)
    list_columns = ['name', 'group']
    related_views = [GroupView]

appbuilder.add_view(
        StudentView,
        "Студенты",
        icon="fa-folder-open-o"
)

class SubjectView(ModelView):
    datamodel = SQLAInterface(Subject)
    list_columns = ['name']

appbuilder.add_view(
        SubjectView,
        "Предметы",
        icon="fa-folder-open-o"
)

class ExamView(ModelView):
    datamodel = SQLAInterface(Exam)
    list_columns = ['date', 'subject', 'student', 'points']

    @action("export_excel", "Export Excel", None, "fa-rocket", single=False)
    def export_excel(self, items):
        items = list(map(lambda x: [x.date, x.student.name, x.subject.name, x.points], items))
        b_sum = sum(map(lambda r: int(r[3]), items))
        items.append(['', '', 'Сумма:', str(b_sum)])
        items.insert(0, ['Дата', 'Студент', 'Предмет', 'Баллы'])
        return excel.make_response_from_array(items, "xlsx")

    @action("export_xml", "Export XML", None, "fa-rocket", single=False)
    def export_xml(self, items):
        items = list(map(lambda x: {'date': x.date, 'student': x.student.name, 'subject': x.subject.name, 'points': x.points}, items))
        data = "<data>\n"
        for row in items:
            data += "<row>\n" + dict2xml(row) + "\n</row>\n"
        data += "</data>"
        resp = Response(data, mimetype='text/xml')
        resp.headers['Content-Disposition'] = "attachment; filename=\"data.xml\""
        return resp
    
    @action("export_word", "Export Word", None, "fa-rocket", single=False)
    def export_word(self, items):
        items = list(map(lambda x: {'date': x.date, 'student': x.student.name, 'subject': x.subject.name, 'points': x.points}, items))
        doc = Document()
        table = doc.add_table(rows=len(items) + 2, cols=4)
        hdr_cells = table.rows[0].cells
        hdr_cells[0].text = 'Дата'
        hdr_cells[1].text = 'Студент'
        #hdr_cells[2].text = 'Группа'
        hdr_cells[2].text = 'Предмет'
        hdr_cells[3].text = 'Баллы'
        b_sum = sum(map(lambda r: int(r['points']), items))
        for i, item in enumerate(items):
            row = table.rows[i + 1].cells
            row[0].text = str(item['date'])
            row[1].text = item['student']
            row[2].text = item['subject']
            row[3].text = str(item['points'])
        table.rows[len(items) + 1].cells[3].text = str(b_sum)
        target_stream = BytesIO()
        doc.save(target_stream)
        target_stream.seek(0)
        return send_file(
            target_stream,
            as_attachment=True,
            attachment_filename='word.docx',
            mimetype='application/vnd.openxmlformats-officedocument.wordprocessingml.document'
        )

appbuilder.add_view(
        ExamView,
        "Экзамены",
        icon="fa-folder-open-o"
)

"""
    Application wide 404 error handler
"""

@appbuilder.app.errorhandler(404)
def page_not_found(e):
    return (
        render_template(
            "404.html", base_template=appbuilder.base_template, appbuilder=appbuilder
        ),
        404,
    )


db.create_all()
