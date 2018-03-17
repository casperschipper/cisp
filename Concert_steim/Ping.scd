(
SynthDef(\casper,
{   | freq = 220, duration = 1.0, amp = 0.1, filter = 1000, filterEnvMup = 1.0|
	var s1, s2,env,filterEnv;
		s1= Saw.ar([freq],1);
	env = EnvGen.ar( Env.perc(0.000001,duration,curve:-10), doneAction:2);
	filterEnv = EnvGen.ar( Env.perc(0.000001,duration*filterEnvMup,curve:-10), doneAction:2);
		s2 = LPF.ar( s1,  (filterEnv * filter )+ 20) * env * amp ;
	Out.ar(0,s2 ! 2 * 0.01);
}).send(s);
)

(
SynthDef(\sine,{
	| duration = 0.1, freq = 220 |
	var env , sig;
	env = Env.perc(0.0001,duration,curve:-4).ar(doneAction:2);
	sig = SinOsc.ar( freq, 0, env);
	Out.ar( 0, sig * 0.4 );
}).send;
)

(
SynthDef(\pulse,{
	| duration = 0.1, freq = 220, pan = 0, attack  = 0.001 |
	var env , sig,filtered,filtEnv;
	env = Env.perc(attack,duration,curve:0).ar(doneAction:2);
	sig = Pulse.ar( freq:freq, width:0.5, mul:env);
	filtEnv = Env.perc(attack,duration,curve:-4).ar;
	filtered = BLowPass.ar( sig,  filtEnv.linlin(0,1,20,\filter.ir) );

	Out.ar( 0, Pan2.ar( LeakDC.ar(filtered * 0.1) , pos:pan ) );
}).send;
)

a = (1..10).collect({|item| item + rrand(0.01,0.05)});

(
SynthDef(\ping,
{   | freq = 220, duration = 1.0, amp = 0.1, filter = 1000, filterEnvMup = 1.0 , pan = 0.0|
	var s1, s2,env,filterEnv;
		s1= SinOsc.ar(a*freq,1) / a.size;
	env = EnvGen.ar( Env.perc(0.001,duration,curve:-2), doneAction:2);
	filterEnv = Env.perc(0.001,duration,curve:-2).ar( doneAction:2);
		s2 = BLowPass.ar(s1,freq:filter,rq:1) * env * amp ;
		Out.ar(0,Pan2.ar(s2,pan));
}).send(s);
)


(
Synth(\casper);
)


(
SynthDef( \gamPing, { | freq = 440,duration = 0.1,gain = 0.1,pos = 0 , attack = 0.01 |
var env = EnvGen.ar(Env.perc(attack,duration,gain,-2),doneAction:2);
	var tone = Pulse.ar([freq.abs],width:0.2).sum*env;
var filtered = MoogFF.ar(
tone,
EnvGen.ar( Env.perc(attack,duration,1,-4)).linlin(0,1,100,4000),1 );
filtered = LeakDC.ar( filtered );
Out.ar(0, Pan2.ar(filtered,pos) * 0.1 );
}).send;
)

s.scope;


(
{
	var sweep;
	var trigger = Impulse.ar(LFNoise2.ar(50,30,10).midicps);
	var length = 1.0 / Demand.ar( trigger, 0, Dwhite(100,10000));
	var freq = Env.perc(0.001,length,curve:-5).ar(gate:trigger);
	var sig;
	sweep = SinOsc.ar((freq*128).midicps) * Env.perc(0.001,0.3,curve:-3).ar(gate:trigger);
	sig = BHiPass.ar(
		sweep,Demand.ar(trigger,0,Dwhite(80,128,inf).midicps),0.1);
	Out.ar( 0, 0.01 * Pan2.ar( sig, Demand.ar( trigger, 0, Dwhite(-1.0,1.0,inf))).clip(-1.0,1.0));
}.play;
)

Server.killAll;

s.boot;

