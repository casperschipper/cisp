/*
(
SynthDef(\Pulse, { | duration = 1.0 |
	var sig = Pulse.ar( \freq.ir(440), mul: \amp.ir(1.0));
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
		(ch 10 20)
		(ch 0.1 0.4 0.8 1.6 3.2)))

(sync 0.14)


(sci2
	Pulse
	(st (chfi (0.1)))

	:freq (wr casper 
		(apply 
			(rd casper)
			(
				(|= (< 20) (st 200))
				(| (> (line (seq 500 16000) (ch .1 .2))) (/ (ch 1 2 4 8 16 32)))
				(guard (+ (seq (st 100) (ch 100 100.001 99.99)))))
				))
	:amp (seq 
		(latch (st 0.1) (ch 3 4 7)) 
		(latch (st 0.0) (st 1)))
	:duration (seq dura dura dura dura)
	:pan (rv -1 1)
	)
