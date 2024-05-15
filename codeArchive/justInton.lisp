/*
SynthDef(\sqr, { | freq = 110.0, dur = 1.0, amp = 1.0, pos = 0.0 |
		var env = EnvGen.ar(Env.perc(0.001,dur), doneAction:2);

	var sig = SinOsc.ar(freq,mul:(freq*env).sin*2.0).sin;
	Out.ar(0,Pan2.ar(sig*amp*env,pos));
}).send(s);
*/

(~ a
	(line 
		(seq 1 20000) 
		(st 17)))


(sci2 
	sqr
	(fractRandTimer (0.001 1.0 2.0 0.02 0.3 0.4 0.001))
	:freq (q (rv 100 (~ a)) (t (seq 1 10 100 200 300 500) (ch 1 2 3 4 5)))
	:amp (st 0.3)
	:dur (mtod (line (seq 0 60) (st 6)))
	:pos (rv -1 1))