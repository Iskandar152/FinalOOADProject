import socket
import sys
from toneplayer import Tone_Player
from noteCreator import noteCreator
from Note import Note
'''
This server class handles the creation of a TCP socket 
that awaits connections from a client, and receives data.
In this case the received data will be about the specific notes that 
were pressed on the ios side 
'''
class Server:
    def __init__(self,host,port):
        #Start the socket
        self.sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.server_address = (host, port)
        self.connection = ""
        self.client = ""
        self.tone_player = Tone_Player()

    def start_server(self):
        print("Starting Up Server")
        #Bind the socket to the server address which is based on the host and port 
        self.sock.bind(self.server_address)
        self.sock.listen(1)
        return True
    def get_client(self):
        #Wait for a client to connect (program blocks while it waits, there is no timeout)
        print("Waiting for Client...")
        self.connection, self.client = self.sock.accept()
        print("Received Connection From: " + str(self.client))
        return True
    def receive_tones(self):
        #If we do receive a connection we start taking in the data 
        print("Receiving Tones")
        while True:
            data = self.connection.recv(16)
            if(data):
                #Data is in binary format and needs to be converted using utf-8
                note = data.decode("utf-8") 
                print("Received: " + str(data))
                #Note creator deciphers the data into notes and then we play the note 
                note_maker = noteCreator(data)
                note = note_maker.create_Note()
                note.play()
                #self.tone_player.play_tone(note,"",1)
            else:
                break

            self.connection.close()
            break
            
            
            
            
                
        
        
