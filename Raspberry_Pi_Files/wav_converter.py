'''
Not being used for this project
This was for a prior attempt at reading wav files
'''
from scipy.io import wavfile
from numpy import savetxt
samplerate, data = wavfile.read("song.wav")

print(samplerate)
print(data)
print(data.shape)
savetxt('data.csv',data,delimiter = ',')
#creates a 0.7 MB CSV.. too large
