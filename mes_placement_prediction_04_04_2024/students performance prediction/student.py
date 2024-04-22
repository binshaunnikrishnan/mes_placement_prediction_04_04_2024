import uuid
from flask import *
from database import *

import pandas as pd
import numpy as np
import pickle
from sklearn.preprocessing import LabelEncoder

student=Blueprint('student',__name__)

@student.route("student_home")
def student_home():
    qa="select * from student where student_id='%s'"%(session['stid'])
    res=select(qa)
    img=res[0]['image']
    name=res[0]['student_name']
    session['img']=img
    session['name']=name
    return render_template("student_home.html",img=img,name=session['name'])

@student.route("view_subject")
def view_subject():
    data={}
    q="SELECT * FROM SUBJECT INNER JOIN course USING (course_id) INNER JOIN hod USING(hod_id) INNER JOIN  student USING(hod_id) WHERE student_id='%s'"%(session['stid'])
    res=select(q)
    data['view']=res
    return render_template("student_view_subject.html",data=data,img=session['img'],name=session['name'])

@student.route("ask_doubts",methods=['get','post'])
def ask_doubts():
    data={}
    q="SELECT * FROM staff INNER JOIN hod USING(hod_id) INNER JOIN student USING(hod_id) WHERE student_id='%s'"%(session['stid'])
    res=select(q)
    data['sel']=res
    if 'submit' in request.form:
        staff=request.form['staff']
        doubt=request.form['doubt']
        q1="insert into doubts values(NULL,'%s','%s','%s','pending',now())"%(session['stid'],staff,doubt)
        insert(q1)
        return '''<script>alert("Doubt sended");window.location='ask_doubts';</script>''' 
    if 'action' in request.args:
        action=request.args['action']
        id1=request.args['id1']
    else:
        action=None
    if action=='update':
        q2="select * from doubts where doubt_id='%s'"%(id1)
        res1=select(q2)
        data['upd']=res1
    if 'update' in request.form:
        doubt=request.form['doubt']
        q3="update doubts set doubt='%s' where doubt_id='%s'"%(doubt,id1)
        update(q3)
        return '''<script>alert("Updated");window.location='ask_doubts';</script>''' 
    if action=='delete':
        q4="delete from doubts where doubt_id='%s'"%(id1)
        delete(q4)
        return '''<script>alert("Deleted");window.location='ask_doubts';</script>''' 
    q5="select * from doubts where student_id='%s'"%(session['stid'])
    res2=select(q5)
    data['view']=res2
    return render_template("student_ask_doubts.html",data=data,img=session['img'],name=session['name'])


@student.route('/student_question',methods=['get','post'])
def student_question():
    print("hhhhhhhhhhhhhhhhhh")

    # load the data into a pandas dataframe
    data = pd.read_csv(r'C:\Users\prith\Desktop\mes_placement_prediction_04_04_2024\mes_placement_prediction_04_04_2024\students performance prediction\output.csv')

    # encode non-numeric values
    le = LabelEncoder()
    for column in data.columns:
        if data[column].dtype == np.object:
            data[column] = le.fit_transform(data[column])

    # load the model from the .pkl file
    with open(r'C:\Users\prith\Desktop\mes_placement_prediction_04_04_2024\mes_placement_prediction_04_04_2024\students performance prediction\model5.pkl', 'rb') as f:
    # with open(r'D:\riss2023\python_riss_2024\python\cusec\students performance prediction\model5.pkl', 'rb') as f:
        model = pickle.load(f)
    if 'submit' in request.form:
        print("***************************")
        os = request.form['os']
        alg = request.form['alg']
        pc = request.form['pc']
        se = request.form['se']
        cn = request.form['cn']
        es = request.form['es']
        ca = request.form['ca']
        math = request.form['math']
        comm = request.form['comm']
        hours = request.form['hours']
        hack = request.form['hack']
        cs = request.form['cs']
        ps = request.form['ps']
        long = request.form['long']
        learn = request.form['learn']
        ec = request.form['ec']
        workshops = request.form['workshops']
        talent = request.form['talent']
        olymp = request.form['olymp']
        rw = request.form['rw']
        mem = request.form['mem']
        higher = request.form['higher']

        print("UUUUUUUUUUUUUUUUUUUUUUUUU")

        label_map = {0: 'Database Developer', 
             1: 'Portal Administrator', 
             2: 'Systems Security Administrator', 
             3: 'Business Systems Analyst', 
             4: 'Software Systems Engineer', 
             5: 'Business Intelligence Analyst', 
             6: 'CRM Technical Developer', 
             7: 'Mobile Applications Developer', 
             8: 'UX Designer', 
             9: 'Quality Assurance Associate', 
             10: 'Web Developer', 
             11: 'Information Security Analyst', 
             12: 'CRM Business Analyst', 
             13: 'Technical Support', 
             14: 'Project Manager', 
             15: 'Information Technology Manager', 
             16: 'Programmer Analyst', 
             17: 'Design & UX', 
             18: 'Solutions Architect', 
             19: 'Systems Analyst', 
             20: 'Network Security Administrator', 
             21: 'Data Architect', 
             22: 'Software Developer', 
             23: 'E-Commerce Analyst', 
             24: 'Technical Services/Help Desk/Tech Support', 
             25: 'Information Technology Auditor', 
             26: 'Database Manager', 
             27: 'Applications Developer', 
             28: 'Database Administrator', 
             29: 'Network Engineer', 
             30: 'Software Engineer', 
             31: 'Technical Engineer', 
             32: 'Network Security Engineer', 
             33: 'Software Quality Assurance (QA) / Testing'}
        user_input = pd.DataFrame({
        'Percentage in Operating Systems': [float(os)],
        'Percentage in Algorithms': [float(alg)],
        'Percentage in Programming Concepts': [float(pc)],
        'Percentage in Software Engineering': [float(se)],
        'Percentage in Computer Networks': [float(cn)],
        'Percentage in Electronics Subjects': [float(es)],
        'Percentage in Computer Architecture': [float(ca)],
        'Percentage in Mathematics': [float(math)],
        'Percentage in Communication Skills': [float(comm)],
        'Hours working per day': [float(hours)],
        'hackathons': [int(hack)],
        'coding skills rating': [float(cs)],
        'public speaking points': [float(ps)],
        'can work long time before system?': [1 if long.lower() == 'yes' else 0],
        'self-learning capability?': [1 if learn.lower() == 'yes' else 0],
        'Extra-courses did': [int(ec)],
        'certifications': [int(ec)],
        'workshops': [int(workshops)],
        'talent tests taken?': [int(talent)],
        'olympiads': [int(olymp)],
        'reading and writing skills [1-5]': [float(rw)],
        'memory capability score [1-10]': [float(mem)],
        'higher education': [1 if higher.lower() == 'yes' else 0],
        # 'type of company want to settle in': [company]
            })





        # encode non-numeric values
        for column in user_input.columns:
            if user_input[column].dtype == np.object:
                user_input[column] = le.transform(user_input[column])


        # make the prediction
        prediction = model.predict(user_input)

        # convert the integer prediction to the corresponding job role string
        suggested_job_role = label_map[prediction[0]]

        qa="insert into predicted_work values(NULL,'%s','%s')"%(session['stid'],suggested_job_role)
        insert(qa)
        return redirect(url_for('student.student_view_output',sug=suggested_job_role))

        # print the suggested job role
        print('Suggested Job Role:', suggested_job_role)

    return render_template("student_career_prediction.html",img=session['img'],name=session['name'])


@student.route('/student_view_output',methods=['get','post'])
def student_view_output():
    sug=request.args['sug']
    print('////////////////////////////////////////////////////////////////////')
    return render_template('student_view_output.html',sug=sug,img=session['img'],name=session['name'])

@student.route('/view_perfo',methods=['get','post'])
def view_perfo():
    data={}
    qa="select * from performance_score where student_id='%s'"%(session['stid'])
    res=select(qa)
    data['view']=res
    return render_template('student_view_perfo.html',data=data,img=session['img'],name=session['name'])

@student.route('/view_placement_notification',methods=['get','post'])
def view_placement_notification():
    data={}
    qa="select * from placement_details inner join companies using(company_id) where status='active'"  
    res=select(qa)
    data['view']=res

    return render_template('student_view_placement_notification.html',data=data,img=session['img'],name=session['name'])



@student.route('/view_recommended')
def view_recommended():
    data={}
    qa="SELECT * FROM placement_details INNER JOIN companies USING(company_id) INNER JOIN predicted_work USING(`description`) WHERE student_id='%s' and status='active'"%(session['stid'])
    res=select(qa)
    data['view']=res
    return render_template('student_view_recommended.html',data=data,img=session['img'],name=session['name'])


@student.route('/apply_job',methods=['get','post'])
def apply_job():
    id=request.args['id']
    s="SELECT * FROM applications WHERE placement_details_id='%s'"%(id)
    chk=select(s)
    if chk:
        return '''<script>alert('You already Applied');window.location='view_recommended'</script>'''
    else:

        if 'submit' in request.form:
            res=request.files['res']
            path="static/"+str(uuid.uuid4())+res.filename
            res.save(path)
            qa="insert into applications values(null,'%s','%s','%s',curdate(),'pending')"%(id,session['stid'],path)
            insert(qa)
            return '''<script>alert('successfully applied');window.location='student_home'</script>'''
    return render_template('apply_job.html',img=session['img'],name=session['name'])

@student.route('/student_view_job')
def student_view_job():
    data={}
    qa="select * from applications inner join placement_details using(placement_details_id) where student_id='%s'"%(session['stid'])
    res=select(qa)
    data['view']=res
    return render_template('student_view_job.html',data=data,img=session['img'],name=session['name'])


