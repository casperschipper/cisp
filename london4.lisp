/*
(
SynthDef(\ping,
{   | freq = 220, duration = 1.0, amp = 0.1, filter = 1000, filterEnvMup = 1.0 , pan = 0.0|
	var s1, s2,env,filterEnv;
				s1= Saw.ar(freq:[freq*0.999,freq*1.001,freq*1.0],mul:1).sum;
	env = EnvGen.ar( Env.perc(0.001,duration,curve:-2), doneAction:2);
	filterEnv = EnvGen.ar( Env.perc(0.1,duration,curve:-2), doneAction:2);
		s2 = BLowPass.ar(s1,freq:filter,rq:0.1) * env * amp ;
		OffsetOut.ar(0,Pan2.ar(s2,pan));
}).send(s);
)
*/

(clone
	(sci2 ping 
	(st 0.14)
	:freq 
	(loop
		(* (line (seq 50 100) (hold (seq 1 2 3) (weights ((1 100) (2 1))))) 
			(+ (hold (seq 1 2 3 2) (seq 1 2 3))
				(latch (seq 1 2 (seq 2.5 4 1.5 5 7) 2) (st 4) )))
		(ch (seq 1 1 1 1 1 1 1 1 1 1.5 2 1.5 2) 2 3 2)
		(ch 1 2 3 2))
	:duration (* (hold (seq 1 2 5) (seq 1 2 3)) 
		(hold (seq 0.1 0.2 0.3) (seq 1 2 3)))
	:amp (line (seq 0.3 0.0 0.1 0.0) (hold (seq 10 20 30) (weights ((1 100) (2 1)))))
	:filter (line (seq 100 (ch 5000 500 10000)) (loop (ch (rv 1 4) 15 20) (rv 2 3) (rv 3 5) ) )
	:pan (st (rvfi -1 1))

	)
21)