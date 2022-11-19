import socket
import sys
from toneplayer import Tone_Player
class Server:
    def __init__(self,host,port):
        self.sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.server_address = (host, port)
        self.connection = ""
        self.client = ""
        self.tone_player = Tone_Player()

    def start_server(self):
        print("Starting Up Server")
        self.sock.bind(self.server_address)
        self.sock.listen(1)
        return True
    def get_client(self):
        print("Waiting for Client...")
        self.connection, self.client = self.sock.accept()
        print("Received Connection From: " + str(self.client))
        return True
    def receive_tones(self):
        print("Receiving Tones")
        while True:
            data = self.connection.recv(16)
            if(data):
                note = data.decode("utf-8") 
                print("Received: " + str(data))
                self.tone_player.play_tone(note,"",1)
            else:
                break

            self.connection.close()
            break
            
            
            
            
                
        
        
