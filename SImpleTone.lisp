/*
(
{
var path =  "/Users/casperschipper/Google Drive/Angel Arranz - Bilbao/New_exports/Utrecht4-simple2-4ch.aiff";
~buffer = Buffer.read(s, path );
}.();	
)

~buffer.inspect;

o = Server.local.options;
o.sampleRate = 48000;
s.reboot;

o.numOutputBusChannels = 4;

(
SynthDef(\playLoop, {
	| start = 0, loopfreq = 20, duration = 1.0, amp = 1.0, pan = 0.0 |
	var loopLength = 1.0 / loopfreq;
	var env = EnvGen.ar( Env( [0, 1, 1, 0], [0, duration, 0], curve:\lin),doneAction:2);
	var startSamp = start * SampleRate.ir;
	var endSamp = startSamp + (loopLength * SampleRate.ir);
	var out = BufRd.ar( 4 ,bufnum:0, phase:Phasor.ar(1, 1, startSamp,endSamp));
	Out.ar( 0, out );
}).add;
)

Synth(\playLoop,[\start, 0.0, \loopfreq,41,\duration,5.0, \pan:1.0]);
Synth(\playLoop,[\start, 2.0, \loopfreq,40,\duration,5.0, \pan:1.0]);
Synth(\playLoop,[\start, 3.0, \loopfreq,40,\duration,5.0, \pan:1.0]);
Synth(\playLoop,[\start, 4.0, \loopfreq,40,\duration,5.0, \pan:1.0]);
Synth(\playLoop,[\start, 5.0, \loopfreq,40,\duration,5.0, \pan:1.0]);
Synth(\playLoop,[\start, 6.0, \loopfreq,40,\duration,5.0, \pan:1.0]);

*/

(fun a 
	(line (seq 10 10 0 0) (seq 10 200 100000)))

(fun b
	(line (seq 10 10 30 30) (seq 10 200 100000)))

(fun c
	(line (seq 100 100 100 1) (seq 30 200 100)))

(fun d
	(line (seq 40 40 45 1) (seq 30 200 100)))

(fun e
	(line (seq 1. 1 0.5 0.5) (seq 40 200 100000)))

(fun f
	(line (seq 1. 1 2 2) (seq 40 200 100000)))

(fun g
	(line (seq 1. 1 1.5 1.5) (seq 40 200 100000)))

(fun h
	(line (seq 1. 1 0.75 0.7) (seq 40 200 100000)))

(sci2
	playLoop
	(st 0.01)
	:duration (st .4)
	:loopFreq (ch c d)
	:start (ch a b)
	:rate (ch e f g h)
	:amp (st 0.1))