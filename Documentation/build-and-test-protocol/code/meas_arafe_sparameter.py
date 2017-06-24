#!/usr/bin/python

import serial
import sys
import time
import io
import datetime
from astroparticlelab import watlowf4
from astroparticlelab import E5062A
from astroparticlelab import DA34970

TherCham = watlowf4.WatlowF4('/dev/ttyS0', 1) #make a thermal chamber
Muxer = DA34970.DA34970A() #make a multiplexer
NWAnl = E5062A.E5062A() #make a network analyzer

port1 = '/dev/ttyECOM'
port0 = '/dev/ttySCOM'
ser=serial.Serial()

settle_time = 60*60*1.5 #two hour settle time
measurement_time = 60*10 #wait time between setting the att and making measurement
wait_a_little_longer = 60*20 #if the chamber hasn't settled yet, we'll wait this additional time

#SigOrTrg= "SIG" #sig or trig measurement
SigOrTrg= "TRG"
ARAFE = 6010 #which ARAFE RF board are we measuring


def main():

	#define our temperature points, in an order that calls for oscillations between highs and lows
	TempPoints = [-20,30,-10,20,0,10]
        #TempPoints = [30,-10,20,0,10]
	#TempPoints=[20] #done temp points
	#define the channels we want to loop over
	Channels = [0,1,2,3]
	#define the attenuator settings we want to loop over
	#AttenuatorSettings = [0,10,20,30,60,90,120]
	#AttenuatorSettings=[0,9]
	#AttenuatorSettings=[0,4,8,12,16,20,24,28,32,36,40,44,48,52,56,60,64,68,72,76,84,88,92,96,100,104,108,112,116,120,124]
	AttenuatorSettings=[0,8,16,24,32,40,48,56,64,72,80,88,96,104,112,120]
	AttenuatorSettings2=[0,16,32,48,64,80,96]	
	#AttenuatorSettings2=[0,16,32]	
	#AttenuatorSettings2=[120]
	#take a measurement every 1 dB is basically what the above is doing

	#make a directory for this quad, signal vs trig

	#now, iterate over temperatures
	for temp in TempPoints:


		stringtemp = "tbdtemp"
		if temp <0 :
			stringtemp = "N%d" %abs(temp)
		if temp ==0 :
			stringtemp = "P0%d" %temp
		if temp>0:
			stringtemp = "P%d" %temp

		directory = "G:\ARAFE%d%s%s" %(ARAFE, SigOrTrg,stringtemp)	
		NWAnl.make_dir(directory)

		#start this thermal run by resetting all of the attenuators
		for chan in Channels:
			set_attenuator("SIG",chan,0)
			set_attenuator("TRG",chan,0)
		
		print "On temperature point %d" %temp
		
		#ready the thermal chamber
		ready_chamber(temp)

		#in the case of the signal attenuator, we just need to measure that one
		if SigOrTrg=="SIG":
			for setting in AttenuatorSettings:
				print "On attenuator setting %d" %setting
				#set all of the channels
				for chan in Channels:
					print "setting channel %d signal attenuator to %d" %(chan, setting)
					set_attenuator("SIG",chan,setting)
				time.sleep(60)
				for chan in Channels:
					print "Working on sparams for signal chan %d" %chan
					collect_sparameters(directory, SigOrTrg,chan, setting,0, temp)
					#fill in a zero for the trigger att, because we don't care its setting
		elif SigOrTrg=="TRG":
			#first loop over signal attenuator settings
			for setting in AttenuatorSettings2: #define a different number of points for the sig att; too many otherwise
				for chan in Channels:
					print "setting channel %d signal attenuator to %d" %(chan, setting)
					set_attenuator("SIG",chan,setting)
				#second loop over trigger attenuator settings
				for setting2 in AttenuatorSettings:
					print "working on sig att setting %d and trig att setting %d" %(setting, setting2)
					for chan2 in Channels:
						print "setting channel %d trigger attenuator to %d" %(chan2, setting2)
						set_attenuator("TRG", chan2, setting2)
					time.sleep(20)
					for chan2 in Channels:
						print "Working on sparams for trigger chan %d" %chan2
						collect_sparameters(directory, SigOrTrg,chan2, setting, setting2,temp)

	print "Done!"
			


def ready_chamber(temp):
	#for every new temperature point, purge the chamber
	#45 seconds should do it
	TherCham.open_GN2()
	time.sleep(45)
	TherCham.close_GN2()

	time.sleep(5)
	#now, set our temperature point
	print "Setting thermal chamber to %d" %temp
	TherCham.set_sp(temp)
	time.sleep(5)

	#and wait for it to come to temperature
	#if(temp!=30): 
        time.sleep(settle_time) #just this once, skip this step for -20
		
	#check to see if we've come to temperature
	#if not, wait another 20 minutes
	temp_meas = TherCham.get_sp()
	time.sleep(5)
	if temp_meas > temp+2 or temp_meas < temp-2:
		print "Temperature is %d but goal is %d, so wait a little longer." %(temp_meas, temp)
		time.sleep(wait_a_little_longer)

	#now, we just gotta move on


def collect_sparameters(directory, SigOrTrg,chan, att_sig, att_trg, temp):
	
	print "Collecting s parameters on channel %d" %chan
	
	#pick which RF multiplexer to close
	rf_in = 0
	rf_out = 1

	if chan==0:
		rf_in = 211
		rf_out = 221
	if chan==1:
		rf_in = 212
		rf_out = 222
	if chan==2:
		rf_in = 213
		rf_out = 223
	if chan==3:
		rf_in = 214
		rf_out = 224

	#close that channel
	print "close r_in muxer to %s" %rf_in
	Muxer.set_RFMUX_close(rf_in)
	time.sleep(2)
	print "close r_in muxer to %s" %rf_in
	Muxer.set_RFMUX_close(rf_out)
	time.sleep(2)

	Parameters = ["S11", "S22", "S12", "S21"]
	for param in Parameters:
		get_files(directory, SigOrTrg,chan, att_sig, att_trg, temp, param)

	
def get_files(directory, SigOrTrg,chan, att_sig, att_trg, temp, param):
	#select the s parameter we are working with	
	NWAnl.set_sparam(1,1,param)
	time.sleep(1)
	SaveName = "default.csv" #default filename

	#set up the signal attenuator string	
	stringatt_sig = "tbdatt_sig"
	if(att_sig<10):
		if att_sig >0: 	stringatt_sig = "SIG00%d" %att_sig
		else: stringatt_sig = "SIG000"
	elif att_sig<100:
		stringatt_sig = "SIG0%d" %att_sig
	elif att_sig >=100:
		stringatt_sig = "SIG%d" %att_sig

	#set up the trigger attenuator string
	stringatt_trg = "tbdatt_trig"
	if(att_trg<10):
		if att_trg >0: 	stringatt_trg  = "TRG00%d" %att_trg
		else: stringatt_trg  = "TRG000"
	elif att_trg<100:
		stringatt_trg = "TRG0%d" %att_trg
	elif att_trg >=100:
		stringatt_trg = "TRG%d" %att_trg

	stringtemp = "tbdtemp"
	if temp <0 :
		stringtemp = "N%d" %abs(temp)
	if temp ==0 :
		stringtemp = "P0%d" %temp
	if temp>0:
		stringtemp = "P%d" %temp

	stringsigtrig = "tbdsigtrig"
	if SigOrTrg == "SIG":
		stringsigtrig = "SIG%d" %chan
	if SigOrTrg == "TRG":
		stringsigtrig = "TRG%d" %chan
		
	
	#get the logmag parameter
	NWAnl.set_trace_type(1,"MLOG") #put the logmag "MLOG" option on screen
	SaveName = "%s/ARAFE%d_%s_%s_%s_T%s_%sMag" %(directory,ARAFE,stringsigtrig,stringatt_sig,stringatt_trg,stringtemp,param)
	NWAnl.save_trace_csv(SaveName)	#save the csv file
	time.sleep(1)

	#repeat for the phase
	NWAnl.set_trace_type(1,"PHAS") #put the phase "PHAS" option on screen
	SaveName = "%s/ARAFE%d_%s_%s_%s_T%s_%sPhs" %(directory,ARAFE,stringsigtrig,stringatt_sig,stringatt_trg,stringtemp,param)
	NWAnl.save_trace_csv(SaveName)	#save the csv file
	time.sleep(1)

	#repeat for the group delay
	NWAnl.set_trace_type(1,"GDEL") #put the group delay "GDEL" option on screen
	SaveName = "%s/ARAFE%d_%s_%s_%s_T%s_%sGdl" %(directory,ARAFE,stringsigtrig,stringatt_sig,stringatt_trg,stringtemp,param)
	NWAnl.save_trace_csv(SaveName)	#save the csv file
	time.sleep(1)
	


def set_attenuator(path, att, setting): #whether sig/trig, attenuation, and its setting
	dt_time = datetime.datetime.now()
	print "%s: Setting %s %d to %d" %(datetime.datetime.now(), path, att, setting)
	cmd="fail"
	if path == "SIG":
		cmd = "sig %d %d \n\r" %(att, setting)
	if path == "TRG":
		cmd = "trig %d %d \n\r" % (att, setting)
        check_connection()
	ser.write(cmd)
	line = ser.readline()
	while len(line) >0:
		print line.rstrip()
		line = ser.readline()
	time.sleep(1)


def check_connection():
        #port0='/dev/ttyUSB0'
        #port1='/dev/ttyUSB1'
        #ser.baudrate=9600
        #ser.timeout=1
        try:
                ser.port=port0
                #try to open the port
                ser.open()
                print "Opening USB successful"
                #if opening will fail, it's either going to fail because the port is already open or because we need to switch ports
        except:
                if ser.isOpen():
                        print "USB port is open, proceed"
                else:
                        print "Either not port zero, or the old  port has closed, open a new one"
                        ser.port=port1
                        ser.open()

        #fine, let's be a real stickler here
        #first, just assign thte port above
        #then, close it, set up the way we want it to talk, and re-open it
        #so dumb, so so dumb
        ser.close()
        ser.baudrate=9600
        ser.timeout=1
        ser.open()
        ser.setDTR(0)
        print "using serial line %s" %ser.port

        #To be more verbose, we have to verify that the port actually exists before we can do anything to it
        #The cleanest way to do that is to just open it, but that would initiative it with the wrong baudrate, etc
        #So, first we open it, then close it, then set the baudrates and such, and then finally re-open it
        #See what I mean about dumb?


main()


