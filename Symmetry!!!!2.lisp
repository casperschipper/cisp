/*
(
SynthDef(\casper,
{   | freq = 220, duration = 1.0, amp = 0.1 |
	var s1, s2,env;
	s1= Saw.ar(freq,1);
	env = EnvGen.ar( Env.perc(0.0001,duration,curve:-8), doneAction:2);
	s2 = LPF.ar( s1,  env* 7000) * env * amp ;
	Out.ar(0,s2 ! 2);
}).send(s);
)
*/

(sync 0.14)

(fun a
	(hold
	(seq 9 12 19 14 16 24)
	(ch 7 5 12)))

(fun b
	(hold
		(seq 0 2 -2)
		(ch 7 12)))

(sci2
	casper
	(seq 0.14 0.12)
	:freq (mtof (+ 
		(+ 
		(seq b (seq 5 5 5 5 5 5 5 5) 7) 
		(hold (seq b 5 (seq a a a 0 2) 7) (seq 3 5 4 3 5 2 2 3 4 5 3)))
		48))
	:duration (weights ((1.0 100) (3.0 5)))
	:filter (seq
		(line (seq 1000 15000) (ch 7 13 33))
		(line (seq 1000 15000) (ch 7 13 33)))
	:filterEnvMup (seq
		(line (seq 0.1 1.5) (ch 7 13 33))
			(line (seq 0.1 1.5) (ch 7 13 33)))
	:amp (seq 0.1 0.05 0.1 0.05 0.1))
