/*
(
o = Server.local.options;
o.sampleRate = 48000;
o.recChannels = 4;
o.numOutputBusChannels = 4;
s.boot;
)


(
{
var path =  "/Users/casperschipper/Google Drive/Angel Arranz - Bilbao/New_exports/Utrecht4-simple2-4ch.aiff";
~buffer = Buffer.read(s, path );
}.();
)

~buffer.inspect;

(
SynthDef(\playLoopWidth, {
	| start = 0, loopfreq = 200, duration = 1.0, amp = 1.0, pan = 0.0,rate = 1.0,width = 0.1 |
	var loopLength = 1.0 / loopfreq; // absolute length for the loopLength. for example: for 20 is 50ms or 0.05 sec.
	var env = EnvGen.ar( Env( [0, 1, 1, 0], [0.01, duration, 0.01], curve:[-3,-3,-3]),doneAction:2); // nothing to do.
	var startSamp = start * SampleRate.ir; // simply seconds times samples
	var endSamp = startSamp + (loopLength * SampleRate.ir); // endsamp is number of seconds of the loop times samplerate, + offset
	var phase = Phasor.ar(1, loopfreq / SampleRate.ir, 0,1); // phasor, stepsize
	var mupper = 1.0 / width;
	var phaseS = (phase * mupper);
	var out = BufRd.ar( 4 ,bufnum:0, phase:phaseS.linlin(0,1,startSamp,endSamp),interpolation:2);
	Out.ar( 0, out * amp * (phaseS < 1));
	//Out.ar(0, phase);
}).add;
)

Synth(\playLoopWidth,[\start, 0.0, \loopfreq,2.0,\duration,5.0, \pan:1.0,\width : 0.5]);
*/

(fun a 
	(line (seq 120 110 90 0) (seq 40 200 100000)))

(fun b
	(line (seq 120 110 30 30) (seq 40 200 100000)))

(fun c
	(line (seq 1 (rv 2 23) 30 22) (seq 30 10 100)))

(fun d
	(line (seq 2 (rv 4.9 55) 30 22) (seq 30 10 100)))

(fun e
	(t (seq 1. 1 0.5 0.5) (seq 40 200 100000)))

(fun f
	(t (seq 1. 1 2 2) (seq 40 200 100000)))

(fun g
	(t (seq 1. 1 1.5 1.5) (seq 40 200 100000)))

(fun h
	(t (seq 1. 1 0.75 0.7) (seq 40 200 100000)))

(fun wilow
	(line (seq 0.2 0.2 0.01 0.01) (seq 33 200 1000)))

(fun wihigh
	(line (seq 0.2 0.2 0.1 0.01) (seq 33 200 1000)))

(fun speakOffset1
	(line (seq 0 0 0 8) (seq 33 30 1000)))

(fun speakOffset2
	(line (seq 0 0 12 0) (seq 33 30 1000)))

(fun lf
	(line (seq -30 70) (rv 3 10)))

(fun hf 
	(line (seq -30 70) (rv 3 10)))

(sci2
	playLoopWidth
	(/ 1.0 (mtof (rv lf hf)))
	:duration (/ 1.0 (- (mtof (rv lf hf)) 30))
	:loopfreq (ch c d)
	:rate (ch e f g h)
	:start (ch a b)
	:amp (st 0.1)
	:speakOffset (rv speakOffset1 speakOffset2)
	:width (ch wilow wihigh))