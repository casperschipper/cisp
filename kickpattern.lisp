/*
(
SynthDef(\kick,
	{   | duration = 0.2, pitch = 84 |
		var env, sig, pEnv;
		env = EnvGen.ar( Env.perc(0.0001,duration,curve:-2),doneAction:-2);
		pEnv = EnvGen.ar( Env.perc( 0.0001, duration * 0.5, curve:-50 ) );
		sig = SinOsc.ar( pEnv.linlin(0,1,50,pitch.midicps) , 0, env);
		Out.ar(0,(sig*2).tanh!2);
}).send(s,["/s_new","kick",s.nextNodeID])
)
*/

(sync 0.45)

(sci2 
	kick
	(st 0.45)
	:duration (st 0.2)
	:pitch (hold (seq 50 30 30 40) 
		(seq 
			(latch (st 1) (ch 3 5 7)) 
			(latch (st 2) (st 1))))
	:pitch2 (hold (seq 10 40 50 40 30) 
		(seq 
			(latch (st 1) (ch 3 5 7)) 
			(latch (st 2) (st 1)))))
