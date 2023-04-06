(
SynthDef( \ping, { | freq = 440,duration = 0.1,gain = 0.1,pos = 0.0 |
var env = EnvGen.ar(Env.perc(0.0001,duration,gain,-2),doneAction:2);
var tone = Saw.ar(freq,env);
var filtered = MoogFF.ar(
tone,
EnvGen.ar( Env.perc(0.0001,duration,1,-20)).linlin(0,1,100,5000), 0.5 );
OffsetOut.ar(0, Pan2.ar(filtered,pos) );
}).send;
)

(
SynthDef(\ping,{ | duration = 1, freq = 440, pan = 0 |
    var env = EnvGen.ar( Env.perc(0.001,duration ), doneAction: 2);
	OffsetOut( 0, SinOsc.ar(1000) );
}).send(s);
)

Synth(\ping);

(
SynthDef(\saw, { | freq = 440, duration = 1.0, pan = 0.0 |
	var freqs = freq * (0.99,0.991..1.01);
	var env = EnvGen.ar( Env.perc(0.001,duration,curve:-4),doneAction:2);
	var sig = Saw.ar( freqs,env ) * 0.2;
	Out.ar( 0, Pan2.ar( sig.sum, pos:pan));
}).send;
)

Synth(\ping);

s.boot;

s.latency = 0.3;
s.latency;

s.latency(0.2);

s.quit;
s.boot;


z = Synth(\default);

s.bind(Synth(\ping,[\freq,rrand(1,1000)]));

r = Routine( {
	s.bind(Synth(\ping,[\freq,rrand(1,1000)]));
	0.01.wait;
});

r.play;
r.stop;

(
Pbind(
	\instrument, \ping,
	\freq, Prand([100,200,300,400,500],inf),
	\duration,Prand([0.01,0.2,0.001,0.3],inf),
	\sustain, Prand([0.01,0.2,0.001,0.3],inf),
	\delta, 1.0 / Prand([2000.0,100.0,3000.0],inf)
).play;
)

Clock.seconds;

s.actualSampleRate;

16044027337265818581 >> 32;

10000213021314214 >> 2;

d = Date.getDate;
d.rawSeconds;

d.rawSeconds;

16044022216158331096L;

4294967296.0f 