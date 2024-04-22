from flask import session
import keras.backend as k
import cv2
from keras.models import model_from_json
from keras.preprocessing import image
from keras.preprocessing.image import ImageDataGenerator

import numpy as np


import face_recognition
import pickle
from datetime import datetime
from core import rec_face_image
from database import *

model = model_from_json(open(r"model\facial_expression_model_structure.json", "r").read())
model.load_weights(r'model\facial_expression_model_weights.h5')  # load weights



face_cascade = cv2.CascadeClassifier(r'model\haarcascade_frontalface_default.xml')

cap = cv2.VideoCapture(0)


emotions = ('angry', 'disgust', 'fear', 'happy', 'sad', 'surprise', 'neutral')

def release_camera():
    cap.release()
    cv2.destroyAllWindows()

def camclick(aid):
    global cap  # Declare cap as global

    # Open the camera
    cap = cv2.VideoCapture(0)

    while True:
        ret, img = cap.read()
        
        # Check if frame capture failed
        if not ret:
            print("Error: Frame capture failed")
            continue

        # Check if the captured frame is empty
        if img is None:
            print("Error: Empty frame captured")
            continue

        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
        faces = face_cascade.detectMultiScale(gray, 1.3, 5)

        for (x, y, w, h) in faces:
            # Process each detected face
            cv2.rectangle(img, (x, y), (x+w, y+h), (255, 0, 0), 2)
            detected_face = cv2.cvtColor(img[y:y+h, x:x+w], cv2.COLOR_BGR2GRAY)
            detected_face = cv2.resize(detected_face, (48, 48))
            img_pixels = image.img_to_array(detected_face)
            img_pixels = np.expand_dims(img_pixels, axis=0)
            img_pixels /= 255

            predictions = model.predict(img_pixels)
            max_index = np.argmax(predictions[0])
            emotion = emotions[max_index]
            cv2.putText(img, emotion, (x, y-5), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255, 0, 0), 2)

            # Save the face image
            sub_face = img[y:y+h, x:x+w]
            FaceFileName = "static/test.jpg"
            cv2.imwrite(FaceFileName, sub_face)

            # Recognize faces and process emotions
            val = rec_face_image(FaceFileName)
            for ele in val:
                # Process each recognized face
                val_str = ele.replace("'", "")
                res = select("select * from student where student_id='%s'" % val_str)
                if res:
                    session['aid'] = aid
                    session['stid'] = val_str
                    # Insert emotion data into the database
                    if emotion == 'happy':
                        insert("insert into emotions values(NULL,'%s','%s','%s','%s',curdate())" % (session['aid'], val_str, emotion, 5))
                    elif emotion == 'neutral':
                        insert("insert into emotions values(NULL,'%s','%s','%s','%s',curdate())" % (session['aid'], val_str, emotion, 4))
                    elif emotion == 'angry':
                        insert("insert into emotions values(NULL,'%s','%s','%s','%s',curdate())" % (session['aid'], val_str, emotion, 2))
                    else:
                        insert("insert into emotions values(NULL,'%s','%s','%s','%s',curdate())" % (session['aid'], val_str, emotion, 1))

                    # Calculate and insert ratings
                    q2 = "SELECT AVG(emotions_score) as avgc FROM emotions WHERE student_id='%s' and assign_id='%s' and `date`=curdate()" % (val_str, session['aid'])
                    res2 = select(q2)
                    if res2:
                        q3 = "insert into ratings values(NULL,'%s','%s','%s',curdate())" % (session['aid'], val_str, res2[0]['avgc'])
                        q4 = "select * from ratings where assign_id='%s' and student_id='%s' and date=curdate()" % (session['aid'], val_str)
                        rt = select(q4)
                        if not rt:
                            insert(q3)
                        if res:
                            q = "UPDATE `ratings` SET `ratings`='%s' WHERE `assign_id`='%s' AND `student_id`='%s' AND `date`=CURDATE()" % (res2[0]['avgc'], session['aid'], val_str)
                            update(q)

        cv2.imshow('img', img)
        if cv2.waitKey(1) & 0xFF == ord('q'):
            # Release camera resources
            cap.release()
            cv2.destroyAllWindows()

            # Restart camera
            cap = cv2.VideoCapture(0)

            break

    # Release resources
    k.clear_session()


# /////////////////////////////////////////
# recognize face image

                                                                                        
def rec_face_image(imagepath):
    print("hy...........",imagepath)

    data = pickle.loads(open('faces.pickles', "rb").read())
    print("DATA : ",data)

    # load the input image and convert it from BGR to RGB
    image = cv2.imread(imagepath)
    print("image : ", image)
    h,w,ch=image.shape
    print("CH : ",ch)
    rgb = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
    print("RGB : ",rgb)

    # detect the (x, y)-coordinates of the bounding boxes corresponding
    # to each face in the input image, then compute the facial embeddings
    # for each face
    print("[INFO] recognizing faces...")
    boxes = face_recognition.face_locations(rgb,
        model='hog')
    encodings = face_recognition.face_encodings(rgb, boxes)
    print("encodings : ",encodings)

    # initialize the list of names for each face detected
    names = []

    # loop over the facial embeddings
    for encoding in encodings:
        # attempt to match each face in the input image to our known
        # encodings
        matches = face_recognition.compare_faces(data["encodings"],
            encoding,tolerance=0.4)
        print("matches : ",matches)
        name = "Unknown"

        # check to see if we have found a match
        if True in matches:
            # find the indexes of all matched faces then initialize a
            # dictionary to count the total number of times each face
            # was matched
            matchedIdxs = [i for (i, b) in enumerate(matches) if b]
            counts = {}

            # loop over the matched indexes and maintain a count for
            # each recognized face face
            for i in matchedIdxs:

                name = data["names"][i]
                counts[name] = counts.get(name, 0) + 1
            print(counts, " rount ")
            # determine the recognized face with the largest number of
            # votes (note: in the event of an unlikely tie Python will
            # select first entry in the dictionary)
            if len(counts) == 1:
                name = max(counts, key=counts.get)
            else:
                name = "-1"
        # update the list of names
        # if name not in names:
        if name != "Unknown":
            names.append(name)
    return names


# ////////////////////////////////////////////////////////

