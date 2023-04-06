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
	(50. 100 200 400 800))

(~ replaceAvg
	(write OSC.table2
		(/ (+ OSC.table)) 2)

(~ replaceOne
	(write OSC.table1
		(index 
			(
				(* (ch OSC.table1) (ch 2. 1.5 1.5 1.0594630943593)) 
				(ch 50 100 200 400 800)
			)
		(weights ((0 100) (1 30))))
		(rv 0 (table-cap OSC.table1))))

(schedule
	(~ replaceOne)
	(st 1))

(procedure foo
	(print OSC.table1))

(schedule foo (st 3.0))

(~ lengthController
	(line
		(ch 1.5 1. 0.5) 
		(ch (grow 0.1 2 8))))


(clone
	(sci2 
		saw
	    (* (seq 0.14 0.13 0.13 0.16) 0.9)
		:freq (hold (seq OSC.table1) (ch 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 3))
		:duration (~ lengthController)
		:pan (st (rvfi -1 1))) 1)



