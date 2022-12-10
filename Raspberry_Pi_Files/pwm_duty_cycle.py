import RPI.GPIO as GPIO
from time import sleep
'''
This is not being used, 
PWM was too difficult to implement reliably on a raspberry pi
Arduinos are better for this 
'''
led_pin = 12
GPIO.setwarnings(False)
GPIO.setmode(GPIO.BOARD)
GPIO.setup(ledpin,GPIO.OUT)
pi_pwm = GPIO.PWM(led_pin,555)
pi_pwm.start(0)


while(True):
    for duty_cycle in range(0,101,1):
        pi_pwm.ChangeDutyCycle(duty)
        sleep(0.01)
    sleep(0.5)

    for duty_cycle in range(100,-1,-1):
        pi_pwm.ChangeDutyCycle(duty)
        sleep(0.01)
    sleep(0.5)
        
