/*
(
SynthDef(\saw, { | freq = 440, duration = 1.0, pan = 0.0 |
	var freqs = freq * (0.99,0.991..1.01);
	var env = EnvGen.ar( Env.perc(0.001,duration,curve:-4),doneAction:2);
	var sig = Saw.ar( freqs,env ) * 0.2;
	Out.ar( 0, Pan2.ar( sig.sum, pos:pan));
}).send;
)

*/


(# OSC.table1 
	(50. 100. 200 300 400 500))

(~ replaceOne
	(write OSC.table1
		(index 
			(
				(* (ch OSC.table1) (ch 0.666667 2 1.5 1.5 1.0594630943593)) 
				(ch 100 200 300 400 500)
			)
		(weights ((0 100) (1 30))))
		(rv 0 5)))

(schedule
	(~ replaceOne)
	(st 1.0))

(procedure foo
	(print OSC.table1))

(schedule foo (st 3.0))

(~ lengthController
	(line
		(ch 0.01 0.1 0.2 0.4) 
		(ch (grow 0.1 2 8))))


(clone
	(sci2 
		saw
		(hold (fractRandTimer (0.001 0.02 0.1 0.3 0.5)) (ch 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 8))
		:freq (hold (seq OSC.table1) (ch 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 8))
		:duration (~ lengthController)
		:pan (st (rvfi -1 1))) 6)



