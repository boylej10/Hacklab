import serial, time
import time
import face_recognition
import cv2
import subprocess

SPEED = 9600
PORT = '/dev/cu.usbmodem1421'
ser = serial.Serial(PORT, SPEED, timeout=10, stopbits=serial.STOPBITS_TWO)

video_capture = cv2.VideoCapture(0)

jack_image = face_recognition.load_image_file("jack.jpg")
jack_face_encoding = face_recognition.face_encodings(jack_image)[0]

known_face_encodings = [
    jack_face_encoding
]

known_face_names = [
    "Jack"
]

face_locations = []
face_encodings = []
face_names = []
process_this_frame = True

message = ser.write(1)

while True:
    ret, frame = video_capture.read()

    small_frame = cv2.resize(frame, (0,0), fx=0.25, fy=0.25)

    rgb_small_frame = small_frame[:, :, ::-1]

    if process_this_frame:
        face_locations = face_recognition.face_locations(rgb_small_frame)
        face_encodings = face_recognition.face_encodings(rgb_small_frame, face_locations)

        face_names = []
        for face_encoding in face_encodings:
            matches = face_recognition.compare_faces(known_face_encodings, face_encoding)
            name = "Unknown"

            if True in matches:
                first_match_index = matches.index(True)
                name = known_face_names[first_match_index]
                ser.write(1)
                face_names.append(name)




                print(name)
                time.sleep(15)
                #exit(0)

            #break







            ##face_names.append(name)

    process_this_frame = not process_this_frame

    for (top, right, bottom, left), name in zip(face_locations, face_names):
        top *= 4
        right *= 4
        bottom *= 4
        left *= 4

        cv2.rectangle(frame, (left, top), (right, bottom), (0, 0, 255), 2)

        cv2.rectangle(frame, (left, bottom - 35), (right, bottom), (0, 0, 255), cv2.FILLED)
        font = cv2.FONT_HERSHEY_DUPLEX
        cv2.putText(frame, name, (left + 6, bottom - 6), font, 1.0, (255, 255, 255), 1)

    cv2.imshow('Video', frame)

    if cv2. waitKey(1) & 0xFF == ord('q'):
        break


video_capture.release()
cv2.destroyAllWindows()
