import pandas as pd
import numpy as np

data = {'internal': [], 'attendance': [], 'performance_score': [], 'btech_subjects': [], 'score': []}

subjects = ['Engineering Physics Lab','Basics Of Civil And Mechanical Engineering','Civil And Mechanical Workshop','Linear Algebra And Calculus','Life Skills','PROFESSIONAL COMMUNICATION','ELECTRICAL AND ELECTRONICS WORKSHOP','BASICS OF ELECTRICAL AND ELECTRONICS ENGINEERING','ENGINEERING CHEMISTRY LAB','VECTOR CALCULUS,DIFFERENTIAL EQUATIONS AND TRANSFORMS','ENGINEERING MECHANICS','LOGIC SYSTEM DESIGN','DATA STRUCTURES LAB','OBJECT ORIENTED PROGRAMMING LAB(IN JAVA)','SUSTAINABLE ENGINEERING','DISCRETE MATHEMATICAL STRUCTURES','OBJECT ORIENTED PROGRAMMING USING JAVA','DATABASE MANAGEMENT SYSTEMS','GRAPH THEORY','OS','COMPUTER ORGANISATION AND ARCHITECTURE','DESIGN AND ENGINEERING','DATABASE MANAGEMENT SYSTEMS LAB','COMPUTER NETWORKS','MICROPROCESSORS AND MICROCONTROLLERS','SYSTEM SOFTWARE','SYSTEM SOFTWARE AND MICROPROCESSORS LAB','FORMAL LANGUAGES AND AUTOMATA THEORY','DISASTER MANAGEMENT','ALGORITHM ANALYSIS AND DESIGN','PROGRAMMING IN PYTHON','COMPREHENSIVE COURSE WORK','INDUSTRIAL ECONOMICS AND FOREIGN TRADE','NETWORKING LAB','COMPILER DESIGN','MINIPROJECT','COMPUTER GRAPHICS AND IMAGE PROCESSING','ARTIFICIAL INTELLIGENCE','ENGINEERING MANAGEMENT','SUSTAINABLE ENGINEERING','WEB PROGRAMMING','NETWORK SECURITY PROTOCOL','PROJECT','NETWORK SECURITY PROTOCOL','CLIENT SERVER ARCHITECTURE','DISTRIBUTED COMPUTING','BLOCKCHAIN']

for i in range(10000):
    internal = np.random.randint(1, 21)
    attendance = np.random.randint(1, 6)
    performance_score = np.random.randint(1, 6)
    btech_subject = np.random.choice(subjects)
    score = int(internal >= 12 and attendance >= 3 and performance_score >= 4)
    data['internal'].append(internal)
    data['attendance'].append(attendance)
    data['performance_score'].append(performance_score)
    data['btech_subjects'].append(btech_subject)
    data['score'].append(score)

df = pd.DataFrame(data)

df.to_csv('sem.csv', index=False)
