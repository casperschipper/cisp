/*
SynthDef(\sqr2, { | freq = 110.0, dur = 1.0, amp = 1.0, pos = 0.0 |
	var env = EnvGen.ar(Env.perc(0.001,dur), doneAction:2);
	var sig = SinOsc.ar(freq,mul:freq,add:freq/2.0).sin.sin;
	Out.ar(0,Pan2.ar(LeakDC.ar(sig*amp*env),pos));
}).send(s);
*/

(fun a
	(line 
		(seq 100 20000) 
		(rv 1 17)))


(sci2 
	sqr2
	(mtod (t (ch 0 40) (ch 0.1 1.0 2.0 4.0)))
	:freq (q (rv a a) (t (seq 0.01 10 20 30 40) (ch 1 2 3 4 5)))
	:amp (st 0.01)
	:dur (mtod (line (ch -40 5) (st 6)))
	:pos (rv (line (seq -1 1) (mtod (line (rv -100 -30) (ch 0.1 1.0 2.0 4.0))))
	(line (seq -1 1) (mtod (line (rv -100 -30) (ch 0.1 1.0 2.0 4.0))))))	