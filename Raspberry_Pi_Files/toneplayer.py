import musicalbeeps
'''
Musical beeps is a library that can musical tones, 
tone player is a class that runs the musical beeps 
commands to play certain notes
'''
class Tone_Player:
    def __init__(self):
        print("Starting Tone Player")
        self.player = musicalbeeps.Player(volume = 0.7, mute_output = False)
    
    def play_tone(self, note, octave, time):
        #User can define the note, octave, and the time interval that notes will play at
        #for now the time interval is going to be constant at 1 second on the server side 
        note_descr = ""
        note_descr += str(note)
        note_descr += str(octave)

        self.player.play_note(note_descr,time)



        
