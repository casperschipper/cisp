(
SynthDef( \ping, { | freq = 440,duration = 0.1,gain = 0.1,pos = 0 |
var env = EnvGen.ar(Env.perc(1,duration,gain,-2),doneAction:2);
var tone = Saw.ar(freq,env);
var filtered = MoogFF.ar(
tone,
EnvGen.ar( Env.perc(1,duration,1,-4)).linlin(0,1,100,9000), 0.1 );
filtered = LeakDC.ar( filtered );
Out.ar(0, Pan2.ar(filtered,pos) );
}).send;
)

s.boot;

(
SynthDef(\kick,
	{   | duration = 0.2, pitch = 84 |
		var env, sig, pEnv;
		env = EnvGen.ar( Env.perc(0.0001,duration,curve:-2),doneAction:-2);
		pEnv = EnvGen.ar( Env.perc( 0.01, duration * 0.5, curve:-20 ) );
		sig = SinOsc.ar( pEnv.linlin(0,1,50,pitch.midicps) , 0, env);
		Out.ar(0,(sig*2).tanh!2);
}).send(s,["/s_new","kick",s.nextNodeID])
)



Server.killAll;

