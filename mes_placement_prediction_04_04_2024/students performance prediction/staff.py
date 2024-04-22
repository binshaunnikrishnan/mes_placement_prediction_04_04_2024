import uuid
from core import *
from flask import *
from database import *
import pandas as pd
import joblib
from sklearn.preprocessing import OneHotEncoder
import numpy as np
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score, precision_score, recall_score, f1_score

staff=Blueprint('staff',__name__)


@staff.route("/staff_home")
def staff_home():
    qa="select * from staff where staff_id='%s'"%(session['sid'])
    res=select(qa)
    session['ho_id']=res[0]['hod_id']
    return render_template("staff_home.html")

@staff.route("/view_subjects")
def view_subjects():
    data={}
    q="SELECT * FROM assign_subjects INNER JOIN `subject` USING(subject_id) WHERE staff_id='%s'"%(session['sid'])
    res=select(q)
   
    data['view']=res
    return render_template("staff_view_subjects.html",data=data)

from em import *
@staff.route("/camera")
def camera():
    aid=request.args['id']
    print(aid,'///////////////////////////////////')
    camclick(aid)


    return "<script>window.location='view_subjects';</script>"

@staff.route("/add_notes",methods=['get','post'])
def add_notes():
    data={}
    id=request.args['id']
    data['id']=id
    session['as_id']=id
    q3="select * from notes where assign_id='%s'"%(session['as_id'])
    print(q3)
    res1=select(q3)
    data['view']=res1
    if 'submit' in request.form:
        file=request.files['file']
        path="static/"+str(uuid.uuid4())+file.filename
        file.save(path)
        q="insert into notes values(NULL,'%s','%s')"%(id,path)
        insert(q)
        return '''<script>alert("Notes added");window.location="add_notes?id='''+id+'''"</script>'''
    if 'action' in request.args:
        action=request.args['action']
        id1=request.args['id1']
    else:
        action=None
    if action=='update':
        q="select * from notes where notes_id='%s'"%(id1)
        res=select(q)
        data['upd']=res
    if 'update' in request.form:
        file=request.form['file']
        path="static/"+str(uuid.uuid4())+file.filename
        file.save(path)    
        q1="update notes set notes='%s' where notes_id='%s'"%(path,id1)
        update(q1)
        return '''<script>alert("Notes updated");window.location="add_notes?id='''+id+'''"</script>'''   
    if action=='delete':
        q2="delete from notes where notes_id='%s'"%(id1)
        delete(q2)
        return '''<script>alert("Notes deleted");window.location="add_notes?id=''' + id + '''"</script>'''  
    return render_template("staff_add_notes.html",data=data)

@staff.route("/add_performance_score",methods=['get','post'])
def add_performance_score():
    data={}
    # qs="select * from performance_score inner join student using(student_id) inner join subject using(subject_id)"
    qs="select * from performance_score inner join student using(student_id)"
    ras=select(qs)
    data['view']=ras
    q="select * from student"
    res=select(q)
    data['sel']=res
    q0="select * from subject"
    ra=select(q0)
    data['sub']=ra
    # qa="select * from semester"
    # r=select(qa)
    # data['sem']=r
    if 'submit' in request.form:
        stud_id=request.form['stud_id']
        attendance=request.form['attendance']
        exam_mark=request.form['exam_mark']
        ce_mark=request.form['ce_mark']
        sports=request.form['sports']
        arts=request.form['arts']
        sub1=request.form['sub']
        # sem=request.form['sem']
        qry="select * from subject where subject_id='%s'"%(sub1)
        res=select(qry)
        sub=res[0]['subject_name']
        model=joblib.load('sem.pkl')
        

        internal_score = float(request.form['exam_mark'])
        attendance_score = float(request.form['attendance'])
        performance_score = float(request.form['ce_mark'])
        # sub = request.form['sub']

        # Perform one-hot encoding on the input subject
        encoder = OneHotEncoder()
        encoder.fit_transform(pd.DataFrame({'btech_subjects': [sub]}))
        subject_encoded = encoder.transform(pd.DataFrame({'btech_subjects': [sub]})).toarray()

        # Check the shape of the encoded subject array
        if subject_encoded.shape[1] == 1:
            # Create a new array with five zeros and set the appropriate index to one
            subject_encoded = np.zeros((1, 47))
            subject_index = {'Engineering Physics Lab':0,'Basics Of Civil And Mechanical Engineering':1,'Civil And Mechanical Workshop':2,'Linear Algebra And Calculus':3,'Life Skills':4,'PROFESSIONAL COMMUNICATION':5,'ELECTRICAL AND ELECTRONICS WORKSHOP':6,'BASICS OF ELECTRICAL AND ELECTRONICS ENGINEERING':7,'ENGINEERING CHEMISTRY LAB':8,'VECTOR CALCULUS,DIFFERENTIAL EQUATIONS AND TRANSFORMS':9,'ENGINEERING MECHANICS':10,'LOGIC SYSTEM DESIGN':11,'DATA STRUCTURES LAB':12,'OBJECT ORIENTED PROGRAMMING LAB(IN JAVA)':13,'SUSTAINABLE ENGINEERING':14,'DISCRETE MATHEMATICAL STRUCTURES':15,'OBJECT ORIENTED PROGRAMMING USING JAVA':16,'DATABASE MANAGEMENT SYSTEMS':17,'GRAPH THEORY':18,'OS':19,'COMPUTER ORGANISATION AND ARCHITECTURE':20,'DESIGN AND ENGINEERING':21,'DATABASE MANAGEMENT SYSTEMS LAB':22,'COMPUTER NETWORKS':23,'MICROPROCESSORS AND MICROCONTROLLERS':24,'SYSTEM SOFTWARE':25,'SYSTEM SOFTWARE AND MICROPROCESSORS LAB':26,'FORMAL LANGUAGES AND AUTOMATA THEORY':27,'DISASTER MANAGEMENT':28,'ALGORITHM ANALYSIS AND DESIGN':29,'PROGRAMMING IN PYTHON':30,'COMPREHENSIVE COURSE WORK':31,'INDUSTRIAL ECONOMICS AND FOREIGN TRADE':32,'NETWORKING LAB':33,'COMPILER DESIGN':34,'MINIPROJECT':35,'COMPUTER GRAPHICS AND IMAGE PROCESSING':36,'ARTIFICIAL INTELLIGENCE':37,'ENGINEERING MANAGEMENT':38,'SUSTAINABLE ENGINEERING':39,'WEB PROGRAMMING':40,'NETWORK SECURITY PROTOCOL':41,'PROJECT':42,'NETWORK SECURITY PROTOCOL':43,'CLIENT SERVER ARCHITECTURE':44,'DISTRIBUTED COMPUTING':45,'BLOCKCHAIN':46}
            subject_encoded[0][subject_index[sub]] = 1

        # Create a DataFrame with the input values and the encoded subject
        input_data = pd.DataFrame({
            'internal': [internal_score],
            'attendance': [attendance_score],
            'performance_score': [performance_score],
            'btech_subjects_Engineering Physics Lab': [subject_encoded[0][0]],
            'btech_subjects_Basics Of Civil And Mechanical Engineering': [subject_encoded[0][1]],
            'btech_subjects_Civil And Mechanical Workshop': [subject_encoded[0][2]],
            'btech_subjects_Linear Algebra And Calculus': [subject_encoded[0][3]],
            'btech_subjects_Life Skills': [subject_encoded[0][4]],

            'btech_subjects_PROFESSIONAL COMMUNICATION': [subject_encoded[0][5]],
            'btech_subjects_ELECTRICAL AND ELECTRONICS WORKSHOP': [subject_encoded[0][6]],
            'btech_subjects_BASICS OF ELECTRICAL AND ELECTRONICS ENGINEERING': [subject_encoded[0][7]],
            'btech_subjects_ENGINEERING CHEMISTRY LAB': [subject_encoded[0][8]],
            'btech_subjects_VECTOR CALCULUS,DIFFERENTIAL EQUATIONS AND TRANSFORMS': [subject_encoded[0][9]],
            'btech_subjects_ENGINEERING MECHANICS': [subject_encoded[0][10]],
        
            'btech_subjects_LOGIC SYSTEM DESIGN': [subject_encoded[0][11]],
            'btech_subjects_DATA STRUCTURES LAB': [subject_encoded[0][12]],
            'btech_subjects_OBJECT ORIENTED PROGRAMMING LAB(IN JAVA)': [subject_encoded[0][13]],
            'btech_subjects_SUSTAINABLE ENGINEERING': [subject_encoded[0][14]],
            'btech_subjects_DISCRETE MATHEMATICAL STRUCTURES': [subject_encoded[0][15]],
            'btech_subjects_OBJECT ORIENTED PROGRAMMING USING JAVA': [subject_encoded[0][16]],

            'btech_subjects_DATABASE MANAGEMENT SYSTEMS': [subject_encoded[0][17]],
            'btech_subjects_GRAPH THEORY': [subject_encoded[0][18]],
            'btech_subjects_OS': [subject_encoded[0][19]],
            'btech_subjects_COMPUTER ORGANISATION AND ARCHITECTURE': [subject_encoded[0][20]],
            'btech_subjects_DESIGN AND ENGINEERING': [subject_encoded[0][21]],

            'btech_subjects_DATABASE MANAGEMENT SYSTEMS LAB': [subject_encoded[0][22]],
            'btech_subjects_COMPUTER NETWORKS': [subject_encoded[0][23]],
            'btech_subjects_MICROPROCESSORS AND MICROCONTROLLERS': [subject_encoded[0][24]],
            'btech_subjects_SYSTEM SOFTWARE': [subject_encoded[0][25]],
            'btech_subjects_SYSTEM SOFTWARE AND MICROPROCESSORS LAB': [subject_encoded[0][26]],
            'btech_subjects_FORMAL LANGUAGES AND AUTOMATA THEORY': [subject_encoded[0][27]],
            'btech_subjects_DISASTER MANAGEMENT': [subject_encoded[0][28]],

            'btech_subjects_ALGORITHM ANALYSIS AND DESIGN': [subject_encoded[0][29]],
            'btech_subjects_PROGRAMMING IN PYTHON': [subject_encoded[0][30]],
            'btech_subjects_COMPREHENSIVE COURSE WORK': [subject_encoded[0][31]],
            'btech_subjects_INDUSTRIAL ECONOMICS AND FOREIGN TRADE': [subject_encoded[0][32]],
            'btech_subjects_NETWORKING LAB': [subject_encoded[0][33]],
            'btech_subjects_COMPILER DESIGN': [subject_encoded[0][34]],
            'btech_subjects_MINIPROJECT': [subject_encoded[0][35]],
            'btech_subjects_COMPUTER GRAPHICS AND IMAGE PROCESSING': [subject_encoded[0][36]],

            'btech_subjects_ARTIFICIAL INTELLIGENCE': [subject_encoded[0][37]],
            'btech_subjects_ENGINEERING MANAGEMENT': [subject_encoded[0][38]],
            'btech_subjects_SUSTAINABLE ENGINEERING': [subject_encoded[0][39]],
            'btech_subjects_WEB PROGRAMMING': [subject_encoded[0][40]],

            'btech_subjects_NETWORK SECURITY PROTOCOL': [subject_encoded[0][41]],
            'btech_subjects_PROJECT': [subject_encoded[0][42]],
            'btech_subjects_NETWORK SECURITY PROTOCOL': [subject_encoded[0][43]],
            'btech_subjects_CLIENT SERVER ARCHITECTURE': [subject_encoded[0][44]],
            'btech_subjects_DISTRIBUTED COMPUTING': [subject_encoded[0][45]],
            'btech_subjects_BLOCKCHAIN': [subject_encoded[0][46]],
                })

        # Use the trained model to make a prediction
        prediction = model.predict(input_data)
        total_possible_marks = 50 + 10 + 10
        print(total_possible_marks,';;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;')
        actual_score = int(ce_mark) + int(attendance) + int(exam_mark)
        print(actual_score,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
        percentage_score = (int(actual_score)/ int(total_possible_marks)) * 100
        print(percentage_score,'///////////////////////////////////////')
        val=round(percentage_score,2)
        print(val)
        print("The percentage score based on the given data is: {:.2f}%".format(percentage_score))

        # Print the prediction
        if prediction[0] == 1 and percentage_score>=42.0:
            q1="insert into performance_score values(NULL,'%s','%s','%s','%s','%s','%s','%s','pass','%s','%s')"%(session['sid'],stud_id,attendance,exam_mark,ce_mark,sports,arts,val,sub1)
            insert(q1)
            return '''<script>alert('pass');window.location='add_performance_score'</script>'''
        else:
            q1="insert into performance_score values(NULL,'%s','%s','%s','%s','%s','%s','%s','fail','%s','%s')"%(session['sid'],stud_id,attendance,exam_mark,ce_mark,sports,arts,val,sub1)
            insert(q1)
            return '''<script>alert('fail');window.location='add_performance_score'</script>'''

 
    return render_template("staff_add_performance_score.html",data=data)

@staff.route("/view_doubts")
def view_doubts():
    data={}
    q="SELECT * FROM doubts INNER JOIN student USING(student_id) WHERE staff_id='%s'"%(session['sid'])
    res=select(q)
    data['view']=res
    return render_template("staff_view_dopubts.html",data=data)
@staff.route("/reply_student",methods=['get','post'])
def reply_studen():
    id2=request.args['id2']
    if 'submit' in request.form:
        reply=request.form['reply']
        q="update doubts set reply='%s' where doubt_id='%s'"%(reply,id2)
        update(q)
        return '''<script>alert("Replied");window.location='view_doubts';</script>''' 
    return render_template("staff_reply_student.html")



@staff.route("/manage_students",methods=['get','post'])
def manage_students():
    data={}
    # q0="select * from semester"
    # ra=select(q0)
    # data['sem']=ra
    q1="select * from staff where staff_id='%s'"%(session['sid'])
    r1=select(q1)
    session['hod_id']=r1[0]['hod_id']
    if 'submit' in request.form:
        name=request.form['name']
        email=request.form['email']
        phone=request.form['phone']
        img=request.files['img']
        path="static/"+str(uuid.uuid4())+img.filename
        img.save(path)
        psw=request.form['psw']
        q="insert into login values(NULL,'%s','%s','student')"%(name,psw)
        res=insert(q)
        q1="insert into student values(NULL,'%s','%s','%s','%s','%s','%s')"%(res,session['hod_id'],name,email,phone,path)
        res8=insert(q1)
        pid=str(res8)
        isFile = os.path.isdir("static/trainimages/"+pid)  
        print(isFile)
        if(isFile==False):
            os.mkdir('static\\trainimages\\'+pid)
        image1=request.files['img1']
        path="static/trainimages/"+pid+"/"+str(uuid.uuid4())+image1.filename
        image1.save(path)

        image2=request.files['img2']
        path="static/trainimages/"+pid+"/"+str(uuid.uuid4())+image2.filename
        image2.save(path)

        image3=request.files['img3']
        path="static/trainimages/"+pid+"/"+str(uuid.uuid4())+image3.filename
        image3.save(path)
        enf("static/trainimages/")
        flash('Added successfully...')
        return '''<script>alert("student added");window.location='manage_students'</script>'''
    if 'action' in request.args:
        action=request.args['action']
        id=request.args['id']
        print(type(id))
    else:
        action=None
    if action=='update':
        q2="select * from student where student_id='%s'"%(id)
        res1=select(q2)
        data['upd']=res1
    if 'update' in request.form:
        name=request.form['name']
        email=request.form['email']
        phone=request.form['phone']
        img=request.files['img']
        #sem=request.args['sem']
        path="static/"+str(uuid.uuid4())+img.filename
        img.save(path)
        if img.filename=='':
            q3="UPDATE `student` SET `student_name`='%s',`email`='%s',`phone`='%s' WHERE `student_id`='%s'"%(name,email,phone,id)
            update(q3)
        else:
            q3="UPDATE `student` SET `student_name`='%s',`email`='%s',`phone`='%s',`image`='%s' WHERE `student_id`='%s'"%(name,email,phone,path,id)
            print(q3)
            update(q3)
        return '''<script>alert("Updated");window.location='manage_students'</script>'''
    if action=='delete':
        q4="delete from student where student_id='%s'"%(id)
        delete(q4)
        return '''<script>alert("student deleted");window.location='manage_students'</script>'''
    q5="select * from student where hod_id='%s'"%(session['hod_id'])
    res2=select(q5)
    data['view']=res2

    return render_template("hod_manage_students.html",data=data)


@staff.route('/view_student_placement')
def view_student_placement():
    data={}
    qa="SELECT *, applications.status AS app_status FROM applications INNER JOIN placement_details USING(placement_details_id) inner join student using(student_id) where hod_id='%s'"%(session['ho_id'])
    res=select(qa)
    data['view']=res
    return render_template('view_student_placement.html',data=data)






