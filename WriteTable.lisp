/*
(
(
SynthDef(\ping,
{   | freq = 220, duration = 1.0, amp = 0.1, filter = 1000, filterEnvMup = 1.0|
	var s1, s2,env,filterEnv;
		s1= Saw.ar([freq,freq*1.001,freq*0.999],1);
	env = EnvGen.ar( Env.perc(0.000001,duration,curve:-10), doneAction:2);
	filterEnv = Env.perc(0.01,duration,curve:-10).ar( doneAction:2);
		s2 = BLowPass.ar(s1,freq:filter+2,rq:1) * env * amp ;
	Out.ar(0,s2 ! 2);
}).send(s);
)
)
	
*/

(sync 0.31)

(~ dur (seq 0.1 0.1))

(fun a
	(hold
	(seq 9 12 19 14 16 24)
	(ch 7 5 12)))

(fun b
	(hold
		(seq 0 2 -2)
		(ch 7 12)))

(# cassie (0. 7 14 21))

(~ foo
	(write cassie 
		(index ( 
			(+ (ch cassie) (* (* 0.1 (slider 9)) (ch -1 1)))
			(rv 0 0))
		(weights ((0 100) (1 1))))
		(rv 0 4)) 

)


(schedule (~ foo) (st 0.01))

(sci2
	pulse
	(~ dur)
	:freq (mtof (+ 50
		(seq cassie)))
	:duration (* (weights ((1.0 100) (3.0 5))) (* (mtof (slider 1 :d 64)) 0.01))
	:filter (seq
		(line (mtof (slider 2 :d 100)) (st 0.05))
		(line (mtof (slider 3 :d 100)) (st 0.05))
		(line (mtof (slider 4 :d 100)) (st 0.05)))
	:amp (seq 0.1 0.1)
	:attack (* (mtof (slider 8 :d 64)) 0.001))
	:pan (line (seq -1 1) (hold (ch .14 0.28 0.56) (ch 5 10)) ))
