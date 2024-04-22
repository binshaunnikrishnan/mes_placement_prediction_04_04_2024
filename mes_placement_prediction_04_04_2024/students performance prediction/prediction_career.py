import pandas as pd
import numpy as np
import pickle
from sklearn.preprocessing import LabelEncoder

# load the data into a pandas dataframe
data = pd.read_csv(r'D:\riss2023\python_riss_2024\python\cusec\students performance prediction\student_career_data.csv')

# encode non-numeric values
le = LabelEncoder()
for column in data.columns:
    if data[column].dtype == np.object:
        data[column] = le.fit_transform(data[column])

# load the model from the .pkl file
with open(r'D:\riss2023\python_riss_2024\python\cusec\students performance prediction\model5.pkl', 'rb') as f:
    model = pickle.load(f)

# get user input
print('Please enter the following information:')
os = input('Percentage in Operating Systems (0-100): ')
alg = input('Percentage in Algorithms (0-100): ')
pc = input('Percentage in Programming Concepts (0-100): ')
se = input('Percentage in Software Engineering (0-100): ')
cn = input('Percentage in Computer Networks (0-100): ')
es = input('Percentage in Electronics Subjects (0-100): ')
ca = input('Percentage in Computer Architecture (0-100): ')
math = input('Percentage in Mathematics (0-100): ')
comm = input('Percentage in Communication Skills (0-100): ')
hours = input('Hours Working per Day (0-24): ')
lq = input('Logical Quotient Rating (0-5): ')
hack = input('Number of Hackathons Attended: ')
cs = input('Coding Skills Rating (0-5): ')
ps = input('Public Speaking Points (0-5): ')
long = input('Can You Work Long Hours Before Computer (yes/no): ')
learn = input('Do You Have Self-Learning Capability (yes/no): ')
ec = input('Number of Extra-Courses/Certifications Done: ')
workshops = input('Number of Workshops/Training Attended: ')
talent = input('Number of Technical Talent Tests Taken: ')
olymp = input('Number of Olympiads Participated: ')
rw = input('Rate Your Reading and Writing Skills (0-5): ')
mem = input('Memory Capability Score (0-10): ')
# interests = input('Please Enter Your Interested Subjects (comma separated): ')
# area = input('Please Enter Your Interested Career Area: ')
higher = input('Do You Want to Pursue Higher Studies (yes/no): ')
# company = input('Please Enter the Type of Company You Want to Settle In: ')




# preprocess user input

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
    'Logical quotient rating': [float(lq)],
    'hackathons': [int(hack)],
    'coding skills rating': [float(cs)],
    'public speaking points': [float(ps)],
    'can work long time before system?': [1 if long.lower() == 'yes' else 0],
    'self-learning capability?': [1 if learn.lower() == 'yes' else 0],
    'Extra-courses did': [int(ec)],
    'certifications': [int(ec)],
    'workshops': [int(workshops)],
    'talent tests taken?': [int(talent)],
    'rate your written communication skills [1-5]': [float(rw)],
    'memory capability score [1-10]': [float(mem)],
    # 'Interested subjects': [interests],
    # 'interested career area': [area],
    'higher education': [1 if higher.lower() == 'yes' else 0],
    # 'type of company want to settle in': [company]
})

# encode non-numeric values
for column in user_input.columns:
    if user_input[column].dtype == np.object:
        user_input[column] = le.transform(user_input[column])

# create a dictionary that maps integer labels to job role strings
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


# make the prediction
prediction = model.predict(user_input)

# convert the integer prediction to the corresponding job role string
suggested_job_role = label_map[prediction[0]]

# print the suggested job role
print('Suggested Job Role:', suggested_job_role)

