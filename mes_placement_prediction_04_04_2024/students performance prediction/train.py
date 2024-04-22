import pandas as pd
import joblib
from sklearn.preprocessing import OneHotEncoder
import numpy as np



df = pd.read_csv('sem.csv')

X = df[['internal', 'attendance', 'performance_score']]  # input variables
y = df['score']  # target variable

# Perform one-hot encoding on the btech_subjects column
encoder = OneHotEncoder()
btech_subjects_encoded = encoder.fit_transform(df[['btech_subjects']]).toarray()
# Concatenate the encoded btech_subjects with the input variables
X = np.concatenate([X, btech_subjects_encoded], axis=1)

from sklearn.model_selection import train_test_split

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

from sklearn.linear_model import LogisticRegression

model = LogisticRegression()
model.fit(X_train, y_train)

from sklearn.metrics import accuracy_score, precision_score, recall_score, f1_score

y_pred = model.predict(X_test)

accuracy = accuracy_score(y_test, y_pred)
precision = precision_score(y_test, y_pred)
recall = recall_score(y_test, y_pred)
f1 = f1_score(y_test, y_pred)

print('Accuracy:', accuracy)
print('Precision:', precision)
print('Recall:', recall)
print('F1-score:', f1)


joblib.dump(model, 'sem.pkl')

# Load the trained model
model = joblib.load('sem.pkl')

# Get user input for the internal score, attendance score, performance score, and subject
internal_score = float(input("Enter internal score: "))
attendance_score = float(input("Enter attendance score: "))
performance_score = float(input("Enter performance score: "))
subject = input("Enter subject: ")

# Perform one-hot encoding on the input subject
subject_encoded = encoder.transform([[subject]]).toarray()

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

# Print the prediction
if prediction[0] == 1:
    print("Pass")
else:
    print("Fail")












