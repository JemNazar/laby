import logging
import flask_excel as excel
from flask import Flask, redirect, render_template, request
from flask_appbuilder import AppBuilder, SQLA
import pandas as pd
from .models import *
import pandas_read_xml as pdx

"""
 Logging configuration
"""

logging.basicConfig(format="%(asctime)s:%(levelname)s:%(name)s:%(message)s")
logging.getLogger().setLevel(logging.DEBUG)

app = Flask(__name__)
app.config.from_object("config")
db = SQLA(app)
excel.init_excel(app)
appbuilder = AppBuilder(app, db.session)

@app.route('/import_excel', methods=['GET', 'POST'])
def load_excel():
    if request.method == 'POST':
        df = pd.read_excel(request.files['file'])
        df = df.drop(index=len(df) - 1)
        Exam.load_from_dataframe(db, df)
        return redirect("/examview/list/")
    return render_template('upload.html')

@app.route('/import_xml', methods=['GET', 'POST'])
def load_xml():
    if request.method == 'POST':
        request.files['file'].save("/tmp/tmp.xml")
        df = pdx.read_xml("/tmp/tmp.xml", ['data'])
        Exam.load_from_dataframe_en(db, df)
        return redirect("/examview/list/")
    return render_template('upload.html')

from . import views
