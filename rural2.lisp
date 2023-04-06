/*
(
SynthDef(\ping,
	{ | freq, amp, duration, filtmup |
		var sig, f, env, ffreq, pink;
		
		sig = Saw.ar([freq,freq*2,freq*3]) + SinOsc.ar(freq/1,mul:1);
		env = EnvGen.ar( Env.perc(0.0001,duration), doneAction:2);
		
		ffreq = (((env*env*env*env* freq) * 8.0)+(128*filtmup).midicps).clip(20,20000);
		
	    pink = [ PinkNoise.ar(0.1) * env * env, PinkNoise.ar(0.1) * env * env];
		
		pink = LPF.ar(pink, 1000);
		
		f = BLowPass4.ar( sig+pink*env, ffreq, rq:2);
		
		Out.ar(0, (f * env * 0.1) ! 2 + pink);
}).add;
)

s.scope;



z = Synth(\ping, [\freq, rrand(40,52).midicps,\amp,1.0, \duration, 5.0]);

s.scope;Resonz
*/

(~ casper
	(hold
		(seq 7 -5)
		(hold (seq 1 9 3) (seq 3 5 7))))

(fun innerwalk (arg)
	(reset 
		(walk 60 
			(hold (seq (~ casper) (~ casper) (~ casper)) (seq 1 3 5))) 
			arg
			(st 4)))

(fun frq
	(innerwalk (innerwalk (st 60))))


(sync 0.125)

(~ a
	(seq 1 3 5 1 3 7 1 3 5))

(~ b
	(seq 3 1 4 5 7 1 3 2))

(fun lll (arg)
	(loop arg (~ a) (~ b)))

(fun c
	(line
		(seq .01 .1 .1 .3 .4 0.01)
		(ch 1 7)))


(sci2
	ping
	(* (seq 0.124 0.126) 1.0)
	:freq (mtof
		(seq (lll frq) (lll frq) (lll frq)))
	:filtmup (seq 
		(line (seq 0.1 0.9 0 ) (seq 3 5 1 6)) 
		(line (seq 0.1 2.0 0) (seq 7 3 5))
		(line (seq 0.1 2.0 0) (seq 1 9 7 4 6)))
	:duration (seq c c)
	)