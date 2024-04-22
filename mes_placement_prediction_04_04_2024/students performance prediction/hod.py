import os
import uuid
from flask import *
from database import *
from core import *

hod=Blueprint('hod',__name__)

@hod.route("hod_home")
def hod_home():
    return render_template("hod_home.html")

@hod.route("manage_course",methods=['get','post'])
def manage_course():
    data={}
    if 'submit' in request.form:
        name=request.form['name']
        q="insert into course values(NULL,'%s','%s')"%(session['h_id'],name)
        insert(q)
        return '''<script>alert(" value inserted");window.location='manage_course'</script>'''
    q1="select * from course where hod_id='%s'"%(session['h_id'])
    res=select(q1)
    data['view']=res
    if 'action' in request.args:
        action=request.args['action']
        id=request.args['id']
        session['c_id']=id
    else:
        action=None
    if action=='update':
        q2="select * from course where course_id='%s'"%(session['c_id'])
        res1=select(q2)
        data['upd']=res1
    if 'update' in request.form:
        name=request.form['name']
        q2="update course set course_name='%s' where course_id='%s'"%(name,session['c_id'])
        update(q2)
        return '''<script>alert("Course updated");window.location='manage_course'</script>'''
    if action=='delete':
        q3="delete from course where course_id='%s'"%(session['c_id'])
        delete(q3)
        return '''<script>alert("Course deleted");window.location='manage_course'</script>'''
    return render_template('hod_manage_course.html',data=data)

@hod.route("add_subject",methods=['get','post'])
def add_subject():
    data={}
    q="select * from course where hod_id='%s'"%(session['h_id'])
    res=select(q)
    data['sel']=res
    # q0="select * from semester"
    # ra=select(q0)
    # data['sem']=ra
    if 'submit' in request.form:
        course=request.form['course']
        sub_name=request.form['sub_name']
        # sem=request.form['sem']
        q1="insert into subject values(NULL,'%s','%s')"%(course,sub_name)
        insert(q1)
        return '''<script>alert("Subject Inserted");window.location='add_subject'</script>'''
    if 'action' in request.args:
        action=request.args['action']
        id=request.args['id']
        session['su_id']=id
    else:
        action=None
    if action=='update':
        q2="select * from subject where subject_id='%s'"%(session['su_id'])
        res1=select(q2)
        data['upd']=res1
    if 'update' in request.form:
        sub_name=request.form['sub_name']
        q3="update subject set subject_name='%s' where subject_id='%s'"%(sub_name,session['su_id'])
        update(q3)
        return '''<script>alert("Subject updated");window.location='add_subject'</script>'''
    if action=='delete':
        q4="delete from subject where subject_id='%s'"%(session['su_id'])
        delete(q4)
        return '''<script>alert("Subject deleted");window.location='add_subject'</script>'''
    q5="SELECT * FROM `subject` INNER JOIN course USING(course_id)  WHERE hod_id='%s' "%(session['h_id'])
    res2=select(q5)
    data['view']=res2
    return render_template("hod_add_subject.html",data=data)

@hod.route("add_staff",methods=['get','post'])
def add_staff():
    data={}
    if 'submit' in request.form:
        staff_name=request.form['staff_name']
        email=request.form['email']
        phone=request.form['phone']
        psw=request.form['psw']
        q="insert into login values(NULL,'%s','%s','staff')"%(staff_name,psw)
        res=insert(q)
        q1="insert into staff values(NULL,'%s','%s','%s','%s','%s')"%(res,session['h_id'],staff_name,email,phone)
        insert(q1)
        return '''<script>alert("Staff added");window.location='add_staff'</script>'''
    q2="select * from staff where hod_id='%s'"%(session['h_id'])
    res1=select(q2)
    data['view']=res1
    if 'action' in request.args:
        action=request.args['action']
        id=request.args['id']
        session['st_id']=id
    else:
        action=None
    if action=="update":
        q3="select * from staff where hod_id='%s'"%(session['h_id'])
        res2=select(q3)
        data['upd']=res2
    if 'update' in request.form:
        staff_name=request.form['staff_name']
        email=request.form['email']
        phone=request.form['phone']
        q4="update staff set staff_name='%s',email='%s',phone='%s' where staff_id='%s'"%(staff_name,email,phone,session['st_id'])
        update(q4)
        return '''<script>alert("Staff updated");window.location='add_staff'</script>'''
    if action=='delete':
        q5="delete from staff where staff_id='%s'"%(session['st_id'])
        delete(q5)
        return '''<script>alert("Staff deleted");window.location='add_staff'</script>'''
    
    return render_template("hod_add_staff.html",data=data)

@hod.route("allocate_subjects",methods=['get','post'])
def allocate_subjects():
    data={}
    q="SELECT * FROM course INNER JOIN `subject` USING(course_id) WHERE hod_id='%s'"%(session['h_id'])
    res=select(q)
    data['sel1']=res
    q1="select * from staff where hod_id='%s'"%(session['h_id'])
    res1=select(q1)
    data['sel2']=res1
    if 'submit' in request.form:
        staff_id=request.form['staff_id']
        session['st1_id']=staff_id
        sub_id=request.form['sub_id']
        session['sub_id']=sub_id
        q2="insert into assign_subjects values(NULL,'%s','%s')"%(staff_id,sub_id)
        insert(q2)
        return '''<script>alert("allocated");window.location='allocate_subjects'</script>'''
    q3="SELECT * FROM assign_subjects INNER JOIN staff USING(staff_id) INNER JOIN `subject` USING(subject_id) WHERE hod_id='%s'"%(session['h_id'])
    res2=select(q3)
    data['view']=res2
    return render_template("hod_allocate_subjects.html",data=data)



@hod.route("hod_view_rating",methods=['get','post'])
def hod_view_rating():
    data={}
    asign_id=request.args['asign_id']
    print(asign_id)
    q="SELECT *,AVG(`ratings`) AS av FROM `ratings` INNER JOIN assign_subjects USING(assign_id) INNER JOIN staff USING(staff_id) WHERE `assign_id`='%s'"%(asign_id)
    print(q)
    res=select(q)
    data['view']=res
    
    return render_template("hod_view_rating.html",data=data)


# @hod.route("manage_students",methods=['get','post'])
# def manage_students():
#     data={}
#     q0="select * from semester"
#     ra=select(q0)
#     data['sem']=ra
#     if 'submit' in request.form:
#         name=request.form['name']
#         email=request.form['email']
#         phone=request.form['phone']
#         sem=request.form['sem']
#         img=request.files['img']
#         path="static/"+str(uuid.uuid4())+img.filename
#         img.save(path)
#         psw=request.form['psw']
#         q="insert into login values(NULL,'%s','%s','student')"%(name,psw)
#         res=insert(q)
#         q1="insert into student values(NULL,'%s','%s','%s','%s','%s','%s','%s')"%(res,session['h_id'],sem,name,email,phone,path)
#         res8=insert(q1)
#         pid=str(res8)
#         isFile = os.path.isdir("static/trainimages/"+pid)  
#         print(isFile)
#         if(isFile==False):
#             os.mkdir('static\\trainimages\\'+pid)
#         image1=request.files['img1']
#         path="static/trainimages/"+pid+"/"+str(uuid.uuid4())+image1.filename
#         image1.save(path)

#         image2=request.files['img2']
#         path="static/trainimages/"+pid+"/"+str(uuid.uuid4())+image2.filename
#         image2.save(path)

#         image3=request.files['img3']
#         path="static/trainimages/"+pid+"/"+str(uuid.uuid4())+image3.filename
#         image3.save(path)
#         enf("static/trainimages/")
#         flash('Added successfully...')
#         return '''<script>alert("student added");window.location='manage_students'</script>'''
#     if 'action' in request.args:
#         action=request.args['action']
#         id=request.args['id']
#         print(type(id))
#     else:
#         action=None
#     if action=='update':
#         q2="select * from student where inner join semester using(semester_id) where student_id='%s'"%(id)
#         res1=select(q2)
#         data['upd']=res1
#     if 'update' in request.form:
#         name=request.form['name']
#         email=request.form['email']
#         phone=request.form['phone']
#         img=request.files['img']
#         sem=request.args['sem']
#         path="static/"+str(uuid.uuid4())+img.filename
#         img.save(path)
#         if img.filename=='':
#             q3="UPDATE `student` SET `student_name`='%s',`email`='%s',`phone`='%s',semester_id='%s' WHERE `student_id`='%s'"%(name,email,phone,id,sem)
#             update(q3)
#         else:
#             q3="UPDATE `student` SET `student_name`='%s',`email`='%s',`phone`='%s',`image`='%s',semester_id='%s' WHERE `student_id`='%s'"%(name,email,phone,path,id,sem)
#             print(q3)
#             update(q3)
#         return '''<script>alert("Updated");window.location='manage_students'</script>'''
#     if action=='delete':
#         q4="delete from student where student_id='%s'"%(id)
#         delete(q4)
#         return '''<script>alert("student added");window.location='manage_students'</script>'''
#     q5="select * from student where hod_id='%s'"%(session['h_id'])
#     res2=select(q5)
#     data['view']=res2

#     return render_template("hod_manage_students.html",data=data)


@hod.route("view_student_perfo")
def view_student_perfo():
    data={}
    qa="SELECT * FROM performance_score INNER JOIN student USING(student_id) INNER JOIN SUBJECT USING(subject_id) WHERE hod_id='%s'"%(session['h_id'])
    res=select(qa)
    data['view']=res
    return render_template('hod_view_student_perfo.html',data=data)


@hod.route("hod_view_staff_perfo")
def hod_view_staff_perfo():
    data={}
    qa="SELECT * FROM ratings INNER JOIN assign_subjects USING(assign_id) INNER JOIN staff USING(staff_id) WHERE hod_id='%s'"%(session['h_id'])
    res=select(qa)
    data['view']=res
    return render_template('hod_view_staff_perfo.html',data=data)


    
 




