from flask import *
from database import *



public=Blueprint('public',__name__)

@public.route("/")
def index():
    return render_template("public_home.html")

@public.route("/login",methods=['get','post'])
def login():
    if 'login' in request.form:
        uname=request.form['uname']
        passw=request.form['passw']
        print(uname,passw,'/////////////////////////////////////////////////////')
        q="SELECT * FROM `login` WHERE `username`='%s' AND `password`='%s'"%(uname,passw)
        res=select(q)
        if res:
            session['lid']=res[0]['login_id']
            if res[0]['usertype']=="admin":
                return redirect(url_for("admin.admin_home"))
            elif res[0]['usertype']=="hod":
                q1="select * from hod where login_id='%s'"%(session['lid'])
                res1=select(q1)
                if res1:
                    session['h_id']=res1[0]['hod_id']
                    return redirect(url_for("hod.hod_home"))
            elif res[0]['usertype']=="placement_cell":
                q4="select * from placement_cell where login_id='%s'"%(session['lid'])
                res4=select(q4)
                if res4:
                    session['pid']=res4[0]['cell_id']
                    return redirect(url_for("placement_cell.placement_home"))
           
            elif res[0]['usertype']=="staff":

                q2="select * from staff where login_id='%s'"%(session['lid'])
                res2=select(q2)
                if res2:
                    session['sid']=res2[0]['staff_id']
                    return redirect(url_for("staff.staff_home"))
            elif res[0]['usertype']=='student':
                q3="select * from student where  login_id='%s'"%(session['lid'])
                res3=select(q3)
                if res3:
                    session['stid']=res3[0]['student_id']
                    print(session['stid'])
                    return redirect(url_for("student.student_home"))

        
        else:
            return "<script>alert('Invalid Username Or Password..');window.location='/login';</script>"

    return render_template("login.html")

# @public.route("/camera")
# def camera():
#     from em import camclick
#     q=camclick()

#     return "<script>window.location='/';</script>"