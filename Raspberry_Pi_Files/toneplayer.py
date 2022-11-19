import musicalbeeps
class Tone_Player:
    def __init__(self):
        print("Starting Tone Player")
        self.player = musicalbeeps.Player(volume = 0.7, mute_output = False)
        
    def play_tone(self, note, octave, time):
        note_descr = ""
        note_descr += str(note)
        note_descr += str(octave)

        self.player.play_note(note_descr,time)



        
