 <CsoundSynthesizer>
<CsOptions>
; --sched for realtime
; -o hw:0 for output device
; -+rtmidi=alsa for alsa midi
; -Ma for all MIDI input devices, could be -M hw:2 if a specific device is prefered
; list of audio device can be found by using cat /proc/asound/cards
-+rtmidi = portmidi -Ma -odac ;hw:2
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 10
nchnls = 1
0dbfs = 1

opcode bandpass, a, a
	ax		xin
	ay filter2 ax, 9, 8, 0.00482434335887887, 0, -0.0192973734355155, 0,0.0289460601532732, 0, -0.0192973734355155, 0,0.00482434335887887, -6.31315503941908, 17.5203283027284, -27.9820743008073, 28.1820959962983, -18.3469637756397, 7.54060918141493, -1.78821981449636, 0.187379492368185
	xout	ay
endop

instr 1
ivel	ampmidi	1
imidno	notnum
; the first MIDI No. is 60
indx 	= imidno - 60

;if (ivel > 0) igoto notedo
if (indx == 0) then   
	; pitch #1
	inote	table 	indx, 2
	asig	oscil	ivel, inote, 1
	asig1 = asig^2 
	asig2 diff asig1
	asig3 = (sr/(4*486.3))*asig2 ; scaling
	asig4 bandpass asig3
	asig5 filter2 asig4,2,32,1.38232028197892e-05,-1.36471614733242e-05,-6.53378169731148,22.0570147483139,-52.3239759132406,99.3300695361588,-161.724304964439,235.020386375668,-312.323595457720,385.513155563472,-446.569783917174,488.770398695719,-507.577253076267,501.178452954428,-470.625368908388,419.560997188715,-353.586791075740,279.400899640913,-203.880445345446,133.255953365962,-72.4358736043776,24.5632097341713,9.12416040760585,-29.1708272124692,37.5555526446139,-37.1936580572336,31.3473997086366,-23.0749957663515,14.8194660790861,-8.15158947491752,3.69450653529871,-1.28151667520582,0.293982189081663,-0.0308973249220885
	out asig5
elseif (indx == 2) then
	; pitch #2
	inote	table 	indx, 2
	asig	oscil	ivel, inote, 1
	asig1 = asig^2 
   	asig2 diff asig1
   	asig3 = (sr/(4*544.9))*asig2 ; scaling
   	asig4 bandpass asig3   	
   	asig5 filter2 asig4,2,14,1.01900402602451e-05,-1.00443787034288e-05,-6.08451567228306,18.4381727524864,-37.9018959915363,60.2744284095654,-79.4614115200893,90.0963620047182,-89.4127907381121,78.0659609373439,-59.6517353618082,39.2333669520395,-21.4875301445196,9.21361427694274,-2.74237073663923,0.420796644827428
	out asig5
elseif (indx == 4) then
	;noteme:
	inote	table 	indx, 2
	asig	oscil	ivel, inote, 1
	asig1 = asig^2 
   	asig2 diff asig1
   	asig3 = (sr/(4*615.2))*asig2 ; scaling
   	asig4 bandpass asig3
   	asig5 filter2 asig4,2,22,1.51893111571455e-06,-1.49378007055937e-06,-6.90071473798451,24.4242715030633,-60.2496068588013,117.974805434035,-196.566697271346,290.094865055118,-388.520549811636,479.456456630777,-550.508908942870,591.655780573285,-597.124057313726,566.404352281837,-504.261361522677,419.764332517261,-324.561136080100,230.697524992616,-148.386892046520,84.2830023457775,-40.6459813547818,15.5700366082718,-4.18227735439838,0.583553726942275
	out asig5
elseif (indx == 5) then
	;notefa:
	inote	table 	indx, 2
	asig	oscil	ivel, inote, 1
	asig1 = asig^2 
   	asig2 diff asig1
   	asig3 = (sr/(4*662.1))*asig2 ; scaling
   	asig4 bandpass asig3
   	asig5 filter2 asig4,2,10,6.71226405091974e-06,-6.59525662479402e-06,-5.61840660238099,15.2147377934274,-26.8724795755197,35.0782327737066,-35.9225978534780,29.4389898858077,-19.0484808468623,9.24793649606004,-3.00291033176599,0.485650269792419
	out asig5
elseif (indx == 7) then
	;notesol:
	inote	table 	indx, 2
	asig	oscil	ivel, inote, 1
	asig1 = asig^2 
   	asig2 diff asig1
   	asig3 = (sr/(4*732.4))*asig2 ; scaling
   	asig4 bandpass asig3
   	asig5 filter2 asig4,2,10,5.10235947769548e-06,-5.00375316939215e-06,-5.64267839512619,15.3530103973612,-27.1965944661360,35.5518096872699,-36.4409296215599,29.8811902864188,-19.3277051105913,9.35854676938111,-3.02163549699005,0.486087560483188
	out asig5
elseif (indx == 9) then
	;notela:
	inote	table 	indx, 2
	asig	oscil	ivel, inote, 1
	asig1 = asig^2 
   	asig2 diff asig1
   	asig3 = (sr/(4*826.2))*asig2 ; scaling
   	asig4 bandpass asig3
   	asig5 filter2 asig4,2,10,1.10707763425991e-06,-1.08286970442633e-06,-5.63507841041064,15.3314562011579,-27.1609415601913,35.4709645622017,-36.2625597971901,29.6070533974180,-19.0389652341853,9.15623917675617,-2.93705856048174,0.470281940115533
	out asig5
elseif (indx == 11) then
	;notete:
	inote	table 	indx, 2
	asig	oscil	ivel, inote, 1
	asig1 = asig^2 
   	asig2 diff asig1
   	asig3 = (sr/(4*937.5))*asig2 ; scaling
   	asig4 bandpass asig3
   	asig5 filter2 asig4,2,10,8.18653133856098e-07,-7.98247777110184e-07,-6.10901442687110,17.6664372236292,-32.5506076491140,43.3804842351105,-44.6414071274674,36.3121658353508,-23.0025158353018,10.7418489667534,-3.29203917231799,0.495398659299417
	out asig5
elseif (indx == 12) then
	;notedoh:
	inote	table 	indx, 2
	asig	oscil	ivel, inote, 1
	asig1 = asig^2 
   	asig2 diff asig1
   	asig3 = (sr/(4*966.8))*asig2 ; scaling
   	asig4 bandpass asig3
   	asig5 filter2 asig4,2,10,4.27899295021742e-06,-4.16899447350947e-06,-5.75190090299937,15.8864109246381,-28.4272238462649,37.3871367884056,-38.4734463862647,31.6577924080310,-20.5472258046894,9.98458020862738,-3.23820278776098,0.523652584741138
	out asig5
endif
endin
</CsInstruments>
<CsScore>
f0      1800

; Sawtooth up and down
f1	0	32768	7	0	16384	1	0	-1	16384	0	 

; Lookup table for khaen first formant frequencies
f2 	0	0	-23	"frequencies.dat"

</CsScore>
</CsoundSynthesizer>
