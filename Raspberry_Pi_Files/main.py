
from server import Server
from toneplayer import Tone_Player



def main():
    
    print("START")
    server = Server("10.202.147.104",9999)
    server.start_server()
    while True:
        if(server.get_client()):
            server.receive_tones()
    


if __name__ == '__main__':
    main()
