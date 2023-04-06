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

(# myReset
	(25. 50 100 200 300 400 500))

(# OSC.table1 
	myReset)



(~ replaceOne
	(write OSC.table1
		(index 
			(
				(* (ch OSC.table1) (ch 0.666667 2 1.5 1.5 1.0594630943593)) 
				(ch myReset)
			)
		(weights ((0 100) (1 100))))
		(rv 0 5)))

(schedule
	(~ replaceOne)
	(st 1.0))

(procedure foo
	(print OSC.table1))

(schedule foo (st 3.0))

(~ lengthController
	(line
		(ch 0.1 0.1 0.1) 
		(ch (grow 0.1 2 8))))


(clone
	(sci2 
		saw
		(hold (seq 0.15 0.15 0.3 0.15 0.15) (ch 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 8))
		:freq (hold (seq OSC.table1) (ch 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 8))
		:duration (~ lengthController)
		:pan (rv -1 1)) 10)



