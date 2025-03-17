/*
SynthDef(\saw, { | freq = 220.0, dur = 1.0, amp = 1.0, pos = 0.0 |
	var sig = Saw.ar(freq) + SinOsc.ar(freq/2.0) + SinOsc.ar(freq*2) + SinOsc.ar(freq*3.5); 
	var env = EnvGen.ar(Env.perc(dur/2.0,dur/2.0),doneAction:2);
	Out.ar(0,Pan2.ar(env*sig*amp,pos));
}).send(s);
*/


(sci2
	saw
	(ch 1)
	:freq 
		(* 
			(+ (seq 
			(index (50 100 200 300 400 500 600 700) (reset (walk 0 (hold (seq -1 0) (seq 1 2))) (st 0) (st 32)))
			(index (50 100 150 300 400 500 600 700) (reset (walk 0 (hold (seq -1 0) (seq 1 2))) (st 0) (st 17)))
			(index (50 100 200 350 400 550 600 900) (reset (walk 0 (hold (seq -1 0) (seq 1 2))) (st 0) (st 19)))
			) (t (bounded-mup-walk (st 1.0) (st 8.0) (ch 0.6667 1.5)) (rv 5 11))))
	:dur (rv .5 60)
	:pos (rv -1 1)
	:amp (st 0.01))