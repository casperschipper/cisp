/*
(
(
SynthDef(\casper,
{   | freq = 220, duration = 1.0, amp = 0.1, filter = 1000, filterEnvMup = 1.0|
	var s1, s2,env,filterEnv;
		s1= Saw.ar([freq,freq*1.001,freq*0.999],1);
	env = EnvGen.ar( Env.perc(0.000001,duration,curve:-10), doneAction:2);
	filterEnv = EnvGen.ar( Env.perc(0.000001,duration*filterEnvMup,curve:-10), doneAction:2);
	s2 = LPF.ar( s1,  filterEnv * filter) * env * amp ;
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
	ping
	(seq 0.16 0.15)
	:freq (mtof (+ 
		(+ 
		(seq 0 (seq 5 5 a a 5 5 5) 7) 
		(hold (seq 0 5 (seq b b b 2) 7) (seq 3 5 4 3 5 2 2 3 4 5 3)))
		48))
	:duration (* (weights ((1.0 100) (3.0 5))) (* (mtof (slider 1)) 0.01))
	:filter (seq
		(line (seq 1000 15000) (ch 7 13 33))
		(line (seq 1000 15000) (ch 7 13 33)))
	:filterEnvMup (seq
		(line (seq 0.1 1.5) (ch 7 13 33))
			(line (seq 0.1 1.5) (ch 7 13 33)))
	:amp (seq 0.1 0.1)
	:pan (line (seq -1 1) (hold (ch .14 0.28 0.56) (ch 5 10)) ))
