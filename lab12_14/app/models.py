from flask_appbuilder import Model
from sqlalchemy import Column, Integer, String, ForeignKey, Date, SmallInteger
from sqlalchemy.orm import relationship
import datetime

"""

You can use the extra Flask-AppBuilder fields and Mixin's

AuditMixin will add automatic timestamp of created and modified by who


"""


class Student(Model):
    id = Column(Integer, primary_key=True)
    name = Column(String, nullable=False)
    group_id = Column(Integer, ForeignKey('group.id'), nullable=False)
    group = relationship('Group')

    def __repr__(self):
        return self.name

class Group(Model):
    id = Column(Integer, primary_key=True)
    code = Column(String, nullable=False)

    def __repr__(self):
        return self.code

class Subject(Model):
    id = Column(Integer, primary_key=True)
    name = Column(String, nullable=False)

    def __repr__(self):
        return self.name

class Exam(Model):
    id = Column(Integer, primary_key=True)
    student_id = Column(Integer, ForeignKey('student.id'), nullable=False)
    student = relationship('Student')
    subject_id = Column(Integer, ForeignKey('subject.id'), nullable=False)
    subject = relationship('Subject')
    date = Column(Date, nullable=False)
    points = Column(SmallInteger, nullable=False)

    def __repr__(self):
        return str(self.date)
    
    @staticmethod
    def load_from_dataframe(db, df):
        db.session.query(Exam).delete()
        for idx, row in df.iterrows():
            student = db.session.query(Student).filter_by(name = row['Студент']).first()
            subject = db.session.query(Subject).filter_by(name = row['Предмет']).first()
            exam = Exam(
                id=idx, 
                student_id=student.id,
                student=student,
                subject_id=subject.id,
                subject=subject,
                date=row['Дата'],
                points=row['Баллы']
            )
            db.session.add(exam)
        db.session.commit()

    @staticmethod
    def load_from_dataframe_en(db, df):
        db.session.query(Exam).delete()
        for idx, row in df.iterrows():
            row = row[0]
            student = db.session.query(Student).filter_by(name = row['student']).first()
            subject = db.session.query(Subject).filter_by(name = row['subject']).first()
            exam = Exam(
                id=idx, 
                student_id=student.id,
                student=student,
                subject_id=subject.id,
                subject=subject,
                date=datetime.datetime.strptime(row['date'], '%Y-%m-%d'),
                points=row['points']
            )
            db.session.add(exam)
        db.session.commit()
