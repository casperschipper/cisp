(
SynthDef( \ping, { | freq = 440,duration = 0.1,gain = 0.1,pos = 0 |
var env = EnvGen.ar(Env.perc(0.0001,duration,gain,-2),doneAction:2);
var tone = Saw.ar(freq,env);
var filtered = MoogFF.ar(
tone,
EnvGen.ar( Env.perc(0.0001,duration,1,-20)).linlin(0,1,100,5000), 0.5 );
Out.ar(0, Pan2.ar(filtered,pos) );
}).send;
)

s.boot;