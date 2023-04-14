/*
SynthDef(\simple, { | freq = 50.0, dur = 1.0, amp = 1.0, pos = 0.0 |
	var env = EnvGen.ar(Env.perc(0.001,dur), doneAction:2);
	var sig = SinOsc.ar(freq).sin;
	Out.ar(0,Pan2.ar(sig*amp*env,pos));
}).send(s);
*/

(fun a 
		(list-walk (1 2 3 4 5 6 7 8 9) (seq 1 1 1 1 1 1 (ch 3 2))))


(fun detune 
	(line
		(seq 0.4 0.41)
		(rv 5 11)
	))


(clone
(sci2 
	simple
	(seq 0.1) 
	:freq (* ((/ a a) 440 detune))
	:dur (st 3.0)
	:pos (rv -1 1)
	:amp (st 0.01)
	)
5)