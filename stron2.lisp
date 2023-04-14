/*
SynthDef(\simple, { | freq = 50.0, dur = 1.0, amp = 1.0, pos = 0.0 |
	var env = EnvGen.ar(Env.perc(0.001,dur), doneAction:2);
	var sig = SinOsc.ar(freq).sin;
	Out.ar(0,Pan2.ar(sig*amp*env,pos));
}).send(s);
*/

(fun a
	(t 
		(ch 1 2 3)
		(ch .1 .3 .5 2. 3. 10 20)))


(sci2 
	simple
	(st 0.14)
	:freq (* (seq (* (/ a a) 440) (* (/ a a) 440) (* (/ a a) 440)) (bounded-mup-walk (st 0.25) (st 9.0) (ch 0.5 1.5)))
	:amp (st 0.1)
	:dur (hold (ch 0.001 0.5 0.1) (ch 3 4 5))
	:pos (rv (line (seq -1 1) (mtod (line (rv -100 -30) (ch 0.1 1.0 2.0 4.0))))
	(line (seq -1 1) (mtod (line (rv -100 -30) (ch 0.1 1.0 2.0 4.0))))))	