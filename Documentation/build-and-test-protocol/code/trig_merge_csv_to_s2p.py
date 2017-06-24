# -*- coding: utf-8 -*-
import pandas as pd
#Need the pandas library

Board = "6003"
SigOrTrig = "TRG"	

def main():

	#get the first file of interest

	Channels = [0,1,2,3] #what channels?
	#AttenuationSettings =  ["010","020","030","060","090","120"] #what attenuation settings?
	#Temperatures = ["N10", "P00", "P10", "P20", "P30"] #what temperatures?
	AttenuationSettingsTrig =  ["000","008","016","024","032","040","048","056","064","072","080","088","096","104","112","120"] #what attenuation settings?
	AttenuationSettingsSig =  ["000","016","032","048","064","080","096"] #what attenuation settings?
	Temperatures = ["P30"] #what temperatures?
	
	for chan in Channels:
		for att_trig in AttenuationSettingsTrig:
			for att_sig in AttenuationSettingsSig:
				for temp in Temperatures:
					S11MagFile = "SOURCE/ARAFE%s_%s%d_SIG%s_TRG%s_T%s_S11MAG.CSV"%(Board, SigOrTrig, chan,att_sig,att_trig, temp)
					S11PhaseFile = "SOURCE/ARAFE%s_%s%d_SIG%s_TRG%s_T%s_S11PHS.CSV"%(Board, SigOrTrig, chan,att_sig,att_trig, temp)
					S11Mag = pd.read_csv(S11MagFile,skiprows=3) #skip the first two rows
					S11Mag.drop(S11Mag.columns[2], axis=1,inplace=True) #drop the third column
					S11Phs = pd.read_csv(S11PhaseFile,skiprows=3)
					S11Phs.drop(S11Phs.columns[2], axis=1,inplace=True)
					S11Mag.columns=['Frequency','|S11|']
					S11Phs.columns=['Frequency','<S11']
				
					S12MagFile = "SOURCE/ARAFE%s_%s%d_SIG%s_TRG%s_T%s_S12MAG.CSV" %(Board, SigOrTrig, chan,att_sig,att_trig, temp)
					S12PhaseFile = "SOURCE/ARAFE%s_%s%d_SIG%s_TRG%s_T%s_S12PHS.CSV" %(Board, SigOrTrig, chan,att_sig,att_trig, temp)
					S12Mag = pd.read_csv(S12MagFile,skiprows=3) #skip the first two rows
					S12Mag.drop(S12Mag.columns[2], axis=1,inplace=True) #drop the third column
					S12Phs = pd.read_csv(S12PhaseFile,skiprows=3)
					S12Phs.drop(S12Phs.columns[2], axis=1,inplace=True)
					S12Mag.columns=['Frequency','|S12|']
					S12Phs.columns=['Frequency','<S12']
				
					S21MagFile = "SOURCE/ARAFE%s_%s%d_SIG%s_TRG%s_T%s_S21MAG.CSV" %(Board, SigOrTrig, chan,att_sig,att_trig, temp)
					S21PhaseFile = "SOURCE/ARAFE%s_%s%d_SIG%s_TRG%s_T%s_S21PHS.CSV" %(Board, SigOrTrig, chan,att_sig,att_trig, temp)
					S21Mag = pd.read_csv(S21MagFile,skiprows=3) #skip the first two rows
					S21Mag.drop(S21Mag.columns[2], axis=1,inplace=True) #drop the third column
					S21Phs = pd.read_csv(S21PhaseFile,skiprows=3)
					S21Phs.drop(S21Phs.columns[2], axis=1,inplace=True)
					S21Mag.columns=['Frequency','|S21|']
					S21Phs.columns=['Frequency','<S21']
				
					S22MagFile = "SOURCE/ARAFE%s_%s%d_SIG%s_TRG%s_T%s_S22MAG.CSV" %(Board, SigOrTrig, chan,att_sig,att_trig, temp)
					S22PhaseFile = "SOURCE/ARAFE%s_%s%d_SIG%s_TRG%s_T%s_S22PHS.CSV" %(Board, SigOrTrig, chan,att_sig,att_trig, temp)
					S22Mag = pd.read_csv(S22MagFile,skiprows=3) #skip the first two rows
					S22Mag.drop(S22Mag.columns[2], axis=1,inplace=True) #drop the third column
					S22Phs = pd.read_csv(S22PhaseFile,skiprows=3)
					S22Phs.drop(S22Phs.columns[2], axis=1,inplace=True)
					S22Mag.columns=['Frequency','|S22|']
					S22Phs.columns=['Frequency','<S22']
								
					merged = S11Mag.merge(S11Phs, on='Frequency').merge(S21Mag, on='Frequency').merge(S21Phs, on='Frequency').merge(S12Mag, on='Frequency').merge(S12Phs, on='Frequency').merge(S22Mag, on='Frequency').merge(S22Phs, on='Frequency')
					merged.rename(columns={'Frequency':'#Frequency'}, inplace=True)
				
					OutputName = "S2P/ARAFE%s_%s%d_SIG%s_TRG%s_T%s.s2p" %(Board, SigOrTrig, chan,att_sig,att_trig, temp)
					merged.to_csv(OutputName,index=False, sep='\t')

#actually execute the main function
main()
