import socket, threading, time

s = socket.socket()
port = 5000
serverIP = input("Enter Server IP\n")
name = input("Enter Your Name\n")

s.connect((serverIP, port))

def getInput():
    global s
    inp = input()
    while inp!='exit':
        s.send(str(name+": "+inp).encode())
        inp = input()
Q = threading.Thread(target=getInput)
Q.start()
while True:
    data = s.recv(1024)
    print(data.decode())
s.close()