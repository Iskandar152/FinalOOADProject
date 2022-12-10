
from server import Server
from toneplayer import Tone_Player



def main():
    
    print("START")
    #Start the server on the devices IP and some host 
    server = Server("10.202.147.104",9999)
    server.start_server()
    while True:
        #Continously check for a client connection
        if(server.get_client()):
            #If the client connected, start receiving tones 
            server.receive_tones()
    


if __name__ == '__main__':
    main()
