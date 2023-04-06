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
	| start = 0, loopfreq = 200, duration = 1.0, amp = 1.0, pan = 0.0,rate = 1.0,width = 0.1, speakOffset = 0, staart = 1.0 |
	var loopLength = 1.0 / loopfreq; // absolute length for the loopLength. for example: for 20 is 50ms or 0.05 sec.
	var env = EnvGen.ar( Env( [0, 1, 1, 0], [0.001, duration, staart], curve:[-3,-3,-9]),doneAction:2); // nothing to do.
	var startSamp = start * SampleRate.ir; // simply seconds times samples
	var endSamp = startSamp + (loopLength * SampleRate.ir); // endsamp is number of seconds of the loop times samplerate, + offset
	var phase = Phasor.ar(1, loopfreq / SampleRate.ir, 0,1); // phasor, stepsize
	var mupper = 1.0 / width;
	var phaseS = (phase * mupper) * rate;
	var out = BufRd.ar( 4 ,bufnum:0, phase:phaseS.linlin(0,1,startSamp,endSamp),interpolation:2);
	Out.ar( speakOffset, out * amp * (phaseS < 1)* env);
	//Out.ar(0, phase);
}).add;
)
Synth(\playLoopWidth,[\start, 0.0, \loopfreq,2.0,\duration,5.0, \pan:1.0,\width : 0.5]);
*/


(fun above
	(line
		(seq (rv 0.0 4.0) (rv 0.999999 1.0001) (st 1.0) (rv 0.99 1.01) (rv 1.0 1.09))
		(st 30)))

(fun low
	(t
		(seq (rv 0.97 1.03) (rv 0.999 1.001) (st 1.0) (ch 0.5 2.0 8.0))
		(st 10)))

(fun loopf
	(t
		(seq (st 0.1) (st 0.1) (rv 0.1 0.2) (rv 0.01 0.1))
		(st 10)))

(fun ampy
	(line
		(seq (st 0.1) (st 0.03) (st 0.02) (st 0.05) (st 0.01))
			(st 10)))

(sci2
	playLoopWidth
	(seq (latch (st 0) (st 64)) (exprv 0.5 14.2 4))
	:duration (hold (ch 0.1 0.5 2.4 6.0 12.0) 64)
	:loopfreq (hold (ch loopf loopf loopf loopf loopf loopf loopf loopf loopf loopf loopf loopf loopf loopf loopf loopf loopf loopf loopf loopf loopf) (st 64))
	:rate (ch low low low low low low low low low low low low low low low low low low low low low low low low low low low low low low low low )
	:start (hold (rv 0 100) (st 64))
	:amp (* ampy (ch 0.1 0.5 0.8 0.2))
	:speakOffset (loop (rv 0 12) (ch 2 4 8 16 64 128) (ch 2 4 8 16 32 64))
	:width (st 1.0)
	:staart (exprv 0.01 6.2 5)
	:attack (st 0.1))
