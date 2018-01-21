(
SynthDef(\saw, { | freq = 440, duration = 1.0, pan = 0.0 |
	var freqs = freq * (0.99,0.991..1.01);
	var env = EnvGen.ar( Env.perc(0.001,duration,curve:-4),doneAction:2);
	var sig = Saw.ar( freqs,env ) * 0.2;
	Out.ar( 0, Pan2.ar( sig.sum, pos:pan));
}).send;
)



(# OSC.table1 
	(100. 200 300 400 500))

(~ replaceOne
	(write OSC.table1
		(ch 
			(* (ch OSC.table1) (ch 0.5 1.5 0.75 1.2)) 
			(ch 100 200 300 400 500))
		(rv 0 5)))

(schedule
	(~ replaceOne)
	(st 1.0))

(fun lengthController
	(line
		(seq 0.1 0.1 0.1 0.1 0.1 0.1 1.0 0.03) 
		(ch (grow 0.1 2 8))))


(clone
	(sci2 
		saw
		(seq 0.12 0.1 0.1 0.1)
		:freq (hold (seq OSC.table1) (ch 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 8))
		:duration lengthController
		:pan (st (rvfi -1 1))) 3)



