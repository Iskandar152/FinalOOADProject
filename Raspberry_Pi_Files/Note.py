from toneplayer import Tone_Player
class Note:
    def __init__(self):
        self.note_name = '' 
        self.tone_player = Tone_Player()
    def play(self):
        self.tone_player.play_tone(self.note_name,"",1)
    
