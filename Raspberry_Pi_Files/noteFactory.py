from Note import Note
class noteFactory:
    def __init__(self):
        #Notes that we can select from 
        self.notes = ['A', 'B', 'C', 'D', 'E', 'F', 'C#', 'D#', 'F#', 'G#', 'A#', 'B#']
    def create_note(self,note_pos, note_list):
        return_note = Note()
        i = 0
        #Based on the note position, we select a note 
        #from self.notes based on where the pressed note was within the 
        #note_list, so it's index
        for note_range in note_list:
            if note_range == note_pos:
                return_note.note_name = self.notes[i]
                print(return_note.note_name)
            i += 1
        return return_note
            

