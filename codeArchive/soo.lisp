/*
SynthDef(\sqr, { | freq = 110.0, dur = 1.0, amp = 1.0, pos = 0.0 |
		var env = EnvGen.ar(Env.perc(0.001,dur), doneAction:2);

	var sig = SinOsc.ar(freq,mul:(freq*env).sin*2.0).sin;
	Out.ar(0,Pan2.ar(sig*amp*env,pos));
}).send(s);
*/

(~ a
	(line 
		(seq 1000 10000) 
		(st 17)))


(sci2 
	sqr
	(mtod (t (ch 30 70) (ch 0.1 1.0 2.0 4.0)))
	:freq (q (rv 100 (~ a)) (t (seq 0.01 1 10 100 200 300 500) (ch 1 2 3 4 5)))
	:amp (st 0.3)
	:dur (mtod (line (ch -35 1) (st 6)))
	:pos (line (seq -1 1) (mtod (line (seq -40 10) (ch 0.1 1.0 2.0 4.0)))))	