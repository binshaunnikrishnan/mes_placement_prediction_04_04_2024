from flask import *
from database import *

placement_cell=Blueprint('placement_cell',__name__)

@placement_cell.route("placement_home")
def placement_home():
    return render_template("placement_home.html")
@placement_cell.route("manage_companies",methods=['get','post'])
def manage_companies():
    data={}
    if 'submit' in request.form:
        c_name=request.form['c_name']
        place=request.form['place']
        addr=request.form['addr']
        q="insert into companies values(NULL,'%s','%s','%s','%s')"%(session['pid'],c_name,place,addr)
        insert(q)
        return '''<script>alert("company added");window.location='manage_companies';</script>''' 
    if 'action' in request.args:
        action=request.args['action']
        id1=request.args['id1']
    else:
        action=None
    if action=='update':
        q1="select * from companies where company_id='%s'"%(id1)
        res=select(q1)
        data['upd']=res
    if 'update' in  request.form:
        c_name=request.form['c_name']
        place=request.form['place']
        addr=request.form['addr']
        q2="update companies set company_name='%s',place='%s',address='%s' where company_id='%s'"%(c_name,place,addr,id1)
        update(q2)
        return '''<script>alert("company updated");window.location='manage_companies';</script>'''  
    if action=='delete':
        q3="delete from companies where company_id='%s'"%(id1)
        delete(q3)
        return '''<script>alert("company deleted");window.location='manage_companies';</script>''' 
    q4="select * from companies where cell_id='%s'"%(session['pid'])     
    res1=select(q4)
    data['view']=res1
    return render_template("placement_manage_companies.html",data=data)

@placement_cell.route("manage_drive_info",methods=['get','post'])
def manage_drive_info():
    data={}
    q3="select * from companies where cell_id='%s'"%(session['pid'])
    res1=select(q3)
    data['sel']=res1
    if 'submit' in request.form:
        company=request.form['company']
        desc=request.form['desc']
        q="insert into placement_details values(NULL,'%s','%s','active')"%(company,desc)
        insert(q)
        return '''<script>alert("inserted");window.location='manage_drive_info';</script>'''
    if 'action' in request.args:
        action=request.args['action']
        id1=request.args['id1']
    else:
        action=None
    if action=='deactivate':
        q1="update placement_details set status='expired' where placement_details_id='%s'"%(id1)
        update(q1)
        return '''<script>alert("Deactivated");window.location='manage_drive_info';</script>'''
    q2="SELECT * FROM placement_details INNER JOIN companies USING(company_id) WHERE  cell_id='%s'"%(session['pid'])
    res=select(q2)
    data['view']=res
    return render_template("placement_manage_drive_info.html",data=data)


@placement_cell.route('view_applied_students',methods=['post','get'])
def view_applied_students():
    data={}
    id=request.args['id1']
    qa="select * from applications inner join student using(student_id) where placement_details_id='%s'"%(id)
    res=select(qa)
    data['view']=res
    return render_template('view_applied_students.html',data=data)


@placement_cell.route('placement_update_status',methods=['get','post'])
def placement_update_status():
    id=request.args['id']
    if 'submit' in request.form:
        upd=request.form['upd']
        qa="update applications set status='%s' where application_id='%s'"%(upd,id)
        update(qa)
        return '''<script>alert('status updated');window.location='manage_drive_info'</script>'''
    return render_template('placement_update_status.html')


