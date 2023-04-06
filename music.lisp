/*
(
SynthDef(\ping,
{   | freq = 220, duration = 1.0, amp = 0.1, filter = 8000, filterEnvMup = 1.0 , pan = 0.0|
	var s1, s2,env,filterEnv;
		s1= SinOsc.ar(a*freq,1) / a.size;
	env = EnvGen.ar( Env.perc(0.001,duration,curve:-2), doneAction:2);
	filterEnv = Env.perc(0.001,duration,curve:-2).ar( doneAction:2);
		s2 = BLowPass.ar(s1,freq:filter,rq:1) * env * amp ;
		Out.ar(0,Pan2.ar(s2,pan));
}).send(s);
)

(
{
	var input = In.ar(0,2);
	var out = DelayC.ar(input,1.0 , 0.16*2);
	[out * 0.75,0];
}.play;
)
	
	*/

(fun sv
	(hold
		(seq 7 12 9 7 14 21)
		(hold (seq 2 3 2 1) (seq 3 4 2 3 4 5))))

(fun fi
	(hold
		(seq 5 7 0 7 14 21 24)
		(hold (seq 2 3 1) (seq 2 1 3 4 2 4))))

(sync 0.16)

(solo)

(sci2
	pulse
	(hold (index
		(3.2 0.08)
		(weights ((0 100) (1 10)))) (st 4))
	:freq (+ 
		(mtof
		(+ 43.34
			(+
				(+ 
					(seq 0 fi sv)
					(hold (seq 0 fi sv) 
						(hold (seq 2 3 1)
							(seq 3 4 3 2 3 2 2 3 4 3))))

				(seq 0 0 0 (ch -12 -19 0 0 0 0 0) 0 0 0 (ch -7 2 4))) 
				)) (seq 0 0.1 0.5))
	:duration (line (seq 10.0 20.0) (rv 1 10))
	:filter (line (seq (seq 1000 1200 800 1000 400) (seq 5000 4000 5000 7000 10000)) (seq 3 7))
	:attack (seq 5.0))