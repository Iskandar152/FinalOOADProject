import math as m
from noteFactory import noteFactory
from Note import Note
class noteCreator:
    def __init__(self,data):
        self.data = data 
        self.tone_x = ''
        self.screen_width = 0
        self.key_Width = 0
        self.columnList = []
        self.note_factory = noteFactory()
    def split(self):
        split_string = self.data.split(b':')
        self.tone_x = int(split_string[0])
        self.screen_width = m.floor(float(split_string[1]))

    def note_divider(self):
        tileLength = (self.screen_width - 20)/12
        self.key_Width = tileLength
        currX = (tileLength/2) + 10

        while(currX < self.screen_width - (tileLength/2) + 10):
            self.columnList.append(m.floor(currX))
            currX += tileLength
    def create_Note(self):
        self.split()
        self.note_divider()
        note = Note()
        note = self.note_factory.create_note(self.tone_x,self.columnList)
        return note
        

