/*
(
SynthDef(\sweepFM,
{
	| duration = 0.02, freq1 = 800, freq2 = 400, ratio = 1.0, index = 1.0, pan = 0.0 |
		var freq = XLine.ar(freq1,freq2,duration,doneAction:2);
		var modFreq = freq * ratio;
		var depth = modFreq * index;
		var mod = SinOsc.ar(modFreq) * depth;
		var sig	= SinOsc.ar( freq + mod );
		var env = SinOsc.ar( 1.0 / duration, 0.5 * pi, 0.5, -0.5 );
		// envelope, raised sine 
		
		Out.ar(0, Pan2.ar( sig * env , pan, 0.1) );
}).add;
)

Synth(\sweepFM);
		s.scope;

		*/

(fun a
	(line (seq -1 1) (ch 13 15 22)))

(fun b 
	(line (seq -1 1) (ch 13 15 22)))

(sci2
	sweepFM
	(rv
	(/ (st 1.0) (line (seq 10 300) (ch 7.0 13 0.5 33)))
	(/ (st 1.0) (line (seq 10 300) (ch 7 11 17 27))))
	:duration (/ (st 1.0) (line (seq 1 20) (ch 33.0 25.0 27.0)))
	:freq1 (line (ch 200 100 200 100 100 400 8000 10000 20000) (ch 33.0 27.0 15.0))

	:freq2 (line (ch 100 40 8000 10) (ch 33.0 27.0 15.0))
	:ratio (line (ch 1.0 2.0 0.0 0.5 3.5 7) (ch 3 5 7 33))
	:index (line (ch 0.0 0.0 1.0 1.5 3.0 4.0) (ch 13 15 22))
	:pan (rv a b)
	)