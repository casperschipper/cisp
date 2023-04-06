/*

(
SynthDef(\casper,
{   | freq = 220, duration = 1.0, amp = 0.1, filter = 1000, filterEnvMup = 1.0|
	var s1, s2,env,filterEnv;
		s1= Saw.ar([freq,freq*1.001,freq*0.999],1);
	env = EnvGen.ar( Env.perc(0.000001,duration,curve:-10), doneAction:2);
	filterEnv = EnvGen.ar( Env.perc(0.000001,duration*filterEnvMup,curve:-10), doneAction:2);
	s2 = BLowPass.ar( s1,freq:filterEnv * filter, 0.1) * env * amp ;
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

(sync 0.31)

(fun detune
	(line
		(seq 0.999 1.001) 
		(ch 1 2 4 8)))

(clone 
(sci2
	ping
	(* (seq 0.16 0.15) 0.8)
	:freq 
(loop
	(* 
		(mtof (+ 
		(+ 
		(seq b (seq 5 5 5 5 5 5 5 5) 7) 
		(hold (seq b 5 (seq a a a 0 2) 7) (seq 3 5 4 3 5 2 2 3 4 5 3)))
		48)) detune) (st 8) (line (seq 8 8 2 2 1 1 1 1 2 3 3 2 1 3) (ch 3 4 7)))
	:duration (* (mtof (slider 1 :d 1)) 0.001)
	:filter (seq
		(line (seq 1000 7000) (ch 7 13 33))
		(line (seq 1000 7000) (ch 7 13 33)))
	:filterEnvMup (seq
		(line (seq 0.1 1.5) (ch 7 13 33))
			(line (seq 0.1 1.5) (ch 7 13 33)))
	:amp (seq (latch (st 0.1) (rv 33 34)) (latch (seq 0.1 0.1 0 0.1 0 0.1 0.1 0.1 0) (ch 3 17 11)))
	:pan (line (seq -1 1) (ch 1 4 8 16)))
3)
