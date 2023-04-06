/*
(
SynthDef(\sweepFM2,
{
	| duration = 0.02, freq1 = 800, freq2 = 400, ratio = 1.0, index = 1.0, pan = 0.0 |
		var freq = XLine.ar(freq1,freq2,duration,doneAction:2);
		var modFreq = freq * ratio;
		var depth = modFreq * index;
		var mod = SinOsc.ar(modFreq) * depth;
		var sig	= SinOsc.ar( freq:freq + mod );
		Out.ar(0, PanAz.ar(numChans:16, in:sig , pos:pan, level:0.01) );
}).send;
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
		(line (seq highF highF highF highF) (fractRandTimer ( 0.001 0.1 1.0 2.0)))
		(st 0.0001)))

(sci2
	sweepFM2
	(/ (st 1.0) (line (mtof (seq 0 30)) (fractRandTimer (0.001 0.1 1.0 2.0))))
	:duration (/ (st 1.0) (line (rf 60 80) (fractRandTimer (0.001 0.1 1.0 2.0))))
	:freq1 (loop (~ casper) (ch 120) (ch 3 10 8))

	:freq2 (loop (~ casper) (ch 20) (ch 3 10 80))
	)