from flask import *
from database import *

admin=Blueprint('admin',__name__)

@admin.route("admin_home")
def admin_home():
    return render_template("admin_home.html")

@admin.route("admin_manage_hod",methods=['get','post'])
def admin_manage_hod():
    data={}
    q="SELECT * FROM `hod`" 
    res=select(q)
    data['hod']=res

    if 'hod_reg' in request.form:
        department=request.form['department']
        hod_name=request.form['hod_name']
        phone=request.form['phone']
        email=request.form['email'] 
        passw=request.form['passw']
        q="SELECT * FROM `login` WHERE `username`='%s' "%(email)
        res=select(q)
        if res:
            return "<script>alert('Username Already Exist. Please Choose Another');window.location='admin_manage_hod';</script>"
        else:
            q="INSERT INTO `login` VALUES(NULL,'%s','%s','hod')"%(email,passw)
            id=insert(q)
            q="INSERT INTO `hod` VALUES(NULL,'%s','%s','%s','%s','%s')"%(id,department,hod_name,email,phone)
            insert(q)
            return "<script>alert('Successfully Registered');window.location='admin_manage_hod';</script>"

    if 'action' in request.args:
        action=request.args['action']
        # lid=request.args['id']
    
    else:
        action=None

    if 'actions' in request.args:
        actions=request.args['actions']
        lid=request.args['id']
    else:
        actions=None
    
    if action=="add_hod":
        data['add_hod']=1
    if action=="view_hod":
        data['view_hod']=0
    if actions == 'update':
        u="select * from hod where login_id='%s'"%(lid)
        data['upda']=res=select(u)
        print("_______________",res)
    if 'update' in request.form:
        department=request.form['department']
        hod_name=request.form['hod_name']
        phone=request.form['phone']
        email=request.form['email']
        up="update hod set department='%s',name='%s',email='%s',phone='%s' where login_id='%s'"%(department,hod_name,email,phone,lid)
        update(up)
        return "<script>alert('Successfully updated');window.location='admin_manage_hod';</script>"
    if actions == 'delete':
        d="delete from hod where login_id='%s'"%(lid)
        delete(d)
        l="delete from login where login_id='%s'"%(lid)
        delete(l)
        return "<script>alert('Successfully deleted');window.location='admin_manage_hod';</script>"

    return render_template("admin_manage_hod.html",data=data)


@admin.route("admin_manage_placement_cell",methods=['get','post'])
def admin_manage_placement_cell():
    data={}
    q="SELECT * FROM `placement_cell`"
    res=select(q)
    data['placement_cell']=res

    if 'placement_cell_reg' in request.form:
        placement_cell_name=request.form['placement_cell_name']
        phone=request.form['phone']
        email=request.form['email']
        passw=request.form['passw']
        q="SELECT * FROM `login` WHERE `username`='%s' "%(email)
        res=select(q)
        if res:
            return "<script>alert('Username Already Exist. Please Choose Another');window.location='admin_manage_placement_cell';</script>"
        else:
            q="INSERT INTO `login` VALUES(NULL,'%s','%s','placement_cell')"%(email,passw)
            id=insert(q)
            q="INSERT INTO `placement_cell` VALUES(NULL,'%s','%s','%s','%s')"%(id,placement_cell_name,email,phone)
            insert(q)
            return "<script>alert('Successfully Registered');window.location='admin_manage_placement_cell';</script>"

    if 'action' in request.args:
        action=request.args['action']
        # lid=request.args['id']
    else:
        action=None
    
    if action=="add_placement_cell":
        data['add_placement_cell']=1
    if action=="view_placement_cell":
        data['view_placement_cell']=0
    if 'actions' in request.args:
        actions=request.args['actions']
        lid=request.args['id']
    else:
        actions=None
    if actions == 'update':
        u="select * from placement_cell where login_id='%s'"%(lid)
        data['upda']=res=select(u)
        print("_______________",res)
    if 'update' in request.form:
        placement_cell_name=request.form['placement_cell_name']
        phone=request.form['phone']
        email=request.form['email']
        
        up="update placement_cell set cell_name='%s',email='%s',phone='%s' where login_id='%s'"%(placement_cell_name,email,phone,lid)
        update(up)
        return "<script>alert('Successfully updated');window.location='admin_manage_placement_cell';</script>"
    if actions == 'delete':
        d="delete from placement_cell where login_id='%s'"%(lid)
        delete(d)
        l="delete from login where login_id='%s'"%(lid)
        delete(l)
        return "<script>alert('Successfully deleted');window.location='admin_manage_placement_cell';</script>"


    return render_template("admin_manage_placement_cell.html",data=data)


@admin.route('hod_view_assign')
def hod_view_assign():
    data={}
    qry="SELECT * FROM assign_subjects INNER JOIN staff USING(staff_id) INNER JOIN `subject` USING(subject_id)"
    res=select(qry)
    data['view']=res
    return render_template('hod_view_assign.html',data=data)

@admin.route('view_rating',methods=['get','post'])
def view_rating():
    data={}
    id=request.args['id']
    qry="SELECT * FROM ratings inner join student using(student_id) WHERE assign_id='%s'"%(id)
    print(qry)
    res=select(qry)
    data['view']=res
    return render_template('view_rating.html',data=data)