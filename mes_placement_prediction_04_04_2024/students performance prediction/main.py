from flask import *
from public import public
from admin import admin
from hod import hod
from staff import staff
from student import student
from placement_cell import placement_cell

app=Flask(__name__)
app.secret_key="hgvehvgfc"
app.register_blueprint(public)
app.register_blueprint(admin,url_prefix='/admin')
app.register_blueprint(hod,url_prefix='/hod')
app.register_blueprint(staff)
app.register_blueprint(student,url_prefix='/student')
app.register_blueprint(placement_cell,url_prefix='/placement_cell')
app.run(debug=True,port=5088)