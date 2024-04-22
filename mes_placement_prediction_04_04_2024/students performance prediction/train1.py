import pandas as pd
import joblib
from sklearn.preprocessing import OneHotEncoder
import numpy as np



df = pd.read_csv('scores1.csv')

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


joblib.dump(model, 'model1.pkl')
