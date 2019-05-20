import socket, select, threading
 

CONNECTION_LIST = []	# list of socket clients
RECV_BUFFER = 4096 # Advisable to keep it as an exponent of 2
PORT = 5000

server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
# this has no effect, why ?
server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
server_socket.bind(("0.0.0.0", PORT))
server_socket.listen(10)

# Add server socket to the list of readable connections
CONNECTION_LIST.append(server_socket)

print( "Chat server started on port " + str(PORT))

def broadcast_data(data,mysock):
    global CONNECTION_LIST
    x,write_sockets,z = select.select([],CONNECTION_LIST,[])
    for i in write_sockets:
        if i!=mysock:
            i.send(data)

while 1:
    # Get the list sockets which are ready to be read through select
    read_sockets,write_sockets,error_sockets = select.select(CONNECTION_LIST,[],[])

    for sock in read_sockets:
        
        #New connection
        if sock == server_socket:
            # Handle the case in which there is a new connection recieved through server_socket
            sockfd, addr = server_socket.accept()
            CONNECTION_LIST.append(sockfd)
            print( "Client (%s, %s) connected" % addr)
            
        #Some incoming message from a client
        else:
            # Data recieved from client, process it
            try:
                #In Windows, sometimes when a TCP program closes abruptly,
                # a "Connection reset by peer" exception will be thrown
                data = sock.recv(RECV_BUFFER)
                # echo back the client message
                if data:
                    print(data.decode())
                    # p = threading.Thread(target=broadcast_data,args=(data,sock,))
                    # p.start()
                    # p.join()
                    x,write,z = select.select([],CONNECTION_LIST,[])
                    for i in write:
                        if i!=sock:
                            i.send(data)
            
            # client disconnected, so remove from socket list
            except:
                # broadcast_data( "Client (%s, %s) is offline" % addr)
                # print( "Client (%s, %s) is offline" % addr)
                sock.close()
                CONNECTION_LIST.remove(sock)
                continue
    
server_socket.close()