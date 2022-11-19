import socket
import sys

class Client:
    def __init__(self,host,port):
        print("Client!")
        self.families = ''
        self.types = ''
        self.protocols = ''
        self.host = host
        self.port = port
        self.sock = ""
    def get_constants(self,prefix):
        return dict((getattr(socket,n),n)
                    for n in dir(socket)
                    if n.startswith(prefix)
                    )

    def setup(self):
        self.families = self.get_constants('AF_')
        self.types = self.get_constants('SOCK_')
        self.protocols = self.get_constants('IPROTO_')

    def connect(self):
        self.sock = socket.create_connection((self.host, self.port))

    def send_note(self,note):
        try:
            print("Sending " + note)
            byte_note = bytes(note, 'utf-8')
            self.sock.sendall(byte_note)

            data = self.sock.recv(16)
            print("Received: " + str(data))
        finally:
            print("Closing Socket")
            self.sock.close()


client = Client("localhost",9989)
client.setup()
client.connect()
client.send_note("E")
client.connect()
client.send_note("D#")
client.connect()
client.send_note("E")
client.connect()
client.send_note("D#")
client.connect()
client.send_note("E")
client.connect()
client.send_note("B3")
client.connect()
client.send_note("D")
client.connect()
client.send_note("C")
client.connect()
client.send_note("A3")


                  
    