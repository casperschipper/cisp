/*
(
SynthDef(\sweepFM2,
{
	| duration = 0.02, freq1 = 800, freq2 = 400, ratio = 1.0, index = 1.0, pan = 0.0, numSamples = 10, flip = -1 |
		var freq = XLine.ar(freq1,freq2,duration,doneAction:2);
		var modFreq = freq * ratio;
		var depth = modFreq * index;
		var mod = SinOsc.ar(modFreq) * depth;
		var sig	= Impulse.ar( freq:freq + mod);
		var env = SinOsc.ar( 1.0 / duration, 0.5 * pi, 0.5, -0.5 );

		sig = Trig.ar( sig, numSamples / SampleRate.ir );

		Out.ar(0, Pan2.ar( sig * env * flip , pan, 0.05) );
}).add;
)
*/

(fun a
	(line (seq -1 1) (ch 0.05 .1 .3 5 13 15 33)))

(fun b 
	(line (seq -1 1) (ch 0.05 .1 .3 5 13 30)))

(fun lowF
	(t
		(rf 0 128)
		(fractRandTimer (0.01 0.1 1.0))))

(fun highF
	(t
		(rf 0 128)
		(fractRandTimer (0.01 0.1 1.0))))

(~ casper
	(t 
		(line (seq highF highF highF highF) (fractRandTimer (0.001 0.1 1.0 2.0)))
		(st 0.0001)))

(sci2
	sweepFM2
	(/ (st 1.0) (line (mtof (seq -50 80)) (fractRandTimer (0.001 0.1 1.0 2.0))))
	:duration (/ (st 1.0) (line (rf -50 50) (fractRandTimer (0.001 0.1 1.0 2.0))))
	:freq1 (loop (~ casper) (ch 4 10 20) (ch 3 10 8))

	:freq2 (loop (~ casper) (ch 4 10 20 80) (ch 3 10 80))
	:ratio (t (ch 0.0 1.0 3.5 0.02) (ch 0.001 0.1 1 7 15))
	:index (t (ch 0.0 0.0 1.0 1.5) (ch 0.001 0.1 1 7 15))
	:pan (rv a b)
	:numSamples (t (ch 100 200 300 (rv 1 300) 1000 20000) (fractRandTimer (0.001 0.2 0.3 1.0 0.01)))
	:flip (seq -1 1)

	)