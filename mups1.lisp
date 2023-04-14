/*
SynthDef(\simple, { | freq = 50.0, dur = 1.0, amp = 1.0, pos = 0.0 |
	var env = EnvGen.ar(Env.perc(0.001,dur), doneAction:2);
	var sig = SinOsc.ar(freq).sin;
	Out.ar(0,Pan2.ar(sig*amp*env,pos));
}).send(s);
*/

(# tab1 
	(1.3 4.322 4.51 6.03 7.9))

(samp-schedule
	(write tab1 (+ (rv -0.1 0.1) (floor (rv 1 10))) (count (table-cap tab1)))
	(rv 4444 88000))

(fun a 
		(list-walk tab1 (seq 1 1 1 1 (ch 1 0 0))))


(sync 0.15)

(fun d1
	(hold
		(seq 1.5 0.5 4.5 5.0 9.0)
		(ch 3 5 11)))




(clone
(sci2 
	simple
	(st 0.15)
	:freq (* a 400)
	:dur (* (seq d1 d1) (line (seq 0.1 1.0) (ch 3 7 11)))
	:pos (loop (rv -1 1) (st 4) (st 4))
	:amp (st 0.01)
	)
3)