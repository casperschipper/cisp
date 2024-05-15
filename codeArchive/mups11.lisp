/*
SynthDef(\simple, { | freq = 50.0, dur = 1.0, amp = 1.0, pos = 0.0 |
	var env = EnvGen.ar(Env.perc(0.001,dur), doneAction:2);
	var sig = SinOsc.ar(freq).sin;
	Out.ar(0,Pan2.ar(sig*amp*env,pos));
}).send(s);
*/

(fun muppy
	(t
		(bounded-mup-walk (st 0.25) (st 16.0) (ch 1.2 0.75 0.8 1.4))
		(ch 0.3 0.5 2.0 3.0 4.0)))

(sci2
	simple
	(st 0.03)
	:freq (* (/ (t (ch 1.01 1.98 3.3 4.3 5.3) (ch 3 4 5)) (t (ch 0.99 2 3 5) (ch 3 4 5))) (st 440))
	:dur (t (ch 1 3) (rv 5 7))
	:amp (st 0.01)
	:pos (rv (line (seq -1 1) (st 5)) (line (seq -1 1) (st 3))))
