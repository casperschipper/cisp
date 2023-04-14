/*
SynthDef(\sqr2, { | freq = 110.0, dur = 1.0, amp = 1.0, pos = 0.0 |
	var env = EnvGen.ar(Env.perc(0.001,dur), doneAction:2);
	var sig = SinOsc.ar(freq,mul:freq,add:freq/2.0).sin.sin;
	Out.ar(0,Pan2.ar(LeakDC.ar(sig*amp*env),pos));
}).send(s);
*/

(fun a
	(t 
		(ch 1 2 3 4 5 6 7 8 9 10)
		(ch .1 .3 .5 2. 3.)))


(sci2 
	simple
	(mtod (line (ch 0 40) (ch 0.1 1.0 2.0 4.0)))
	:freq (* (/ a a) 440)
	:amp (st 0.01)
	:dur (mtod (line (ch -45 40) (st 6)))
	:pos (rv (line (seq -1 1) (mtod (line (rv -100 -30) (ch 0.1 1.0 2.0 4.0))))
	(line (seq -1 1) (mtod (line (rv -100 -30) (ch 0.1 1.0 2.0 4.0))))))	