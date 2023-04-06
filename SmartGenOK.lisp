/*
(
SynthDef(\Pulse2, { | duration = 1.0, freq = 440 |
	var freqline = XLine.ar(freq , \ratio.ir(2.0) * freq, duration);
	var sig = Pulse.ar( freqline,width:0.1, mul: \amp.ir(1.0));
	var env = EnvGen.ar( Env.perc(duration/2,duration/2, curve:0), doneAction:2 );
	Out.ar(0, Pan2.ar( sig*env , \pan.ir) );
}).send;
)

Synth(\Pulse);
*/

(define 
	casper
	100)

(fun
	dura
	(t
		(ch .01 0.1 3)
		(ch 0.1 0.4 0.8 1.6 3.2)))

(sync 0.14)


(sci2
	Pulse2
	(line (ch 0.01 0.03 0.01 0.1 0.5) (ch 1 2 3 .1))

	:freq (wr casper 
		(apply 
			(rd casper)
			(
				(|= (< 20) (st 200))
				(| (> (line (seq 5000 16000) (ch .1 .2))) (/ (ch 1 2 4)))
				(guard (+ (seq (st 100) (ch 100 100.001 99.99)))))
				))
	:ratio (line (ch 300 800 1000 10 20 2 1 1 1 1 1) (ch .1 .5 .2))
	:amp (st 0.1)
	:duration (seq dura dura)
	:pan (line (seq -1 1) (fractRandTimer (ch 0.001 0.1 0.2 1 2 4)))
	:mod (line (seq 1 3 100 1000 0.1 0.2 0.5) (ch 1 .1 4 .0))
	)
