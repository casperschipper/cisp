(
{
	var pitch = Gendy3.ar( ampdist:0,durdist:0,adparam:0.0001,ddparam:0.001,freq:10,initCPs:2 );
	pitch = pitch.linlin(-1,1,0,70);
	Gendy3.ar( ampdist: 0, durdist:0,adparam:0.0001,ddparam:0.0001,freq:pitch.midicps,ampscale:0.5,durscale:0.5,initCPs:80) ! 2;
}.play;
)

(
{Pan2.ar(
Mix.new(Gendy3.ar(3,5,1.0,1.0,(Array.fill(5,{LFNoise0.kr(1.3.rand,1,2)})*MouseX.kr(100,378,'exponential')),MouseX.kr(0.01,0.05),MouseY.kr(0.001,0.016),5,mul:0.1)))}.play
)

(
{
	var sig = 	SinOsc.ar(
		Demand.ar(
			Impulse.ar(
				SinOsc.ar(0.05).linlin(-1,1,-80,128).midicps),1,Dwhite(1.0,128.0).midicps));
	var panSig = SinOsc.ar(
		Demand.ar(
			Impulse.ar(
				SinOsc.ar(0.17).linlin(-1,1,-80,128).midicps),1,Dwhite(1.0,128.0).midicps));
	Pan2.ar(sig,panSig);
}.play;
)

(
SynthDef(\saw,
{   |
	gain = 1.0,
	freq = 220,
	duration = 1.0
	|
	var ampEnv = EnvGen.ar( Env.perc(0.0001,duration) , doneAction:2);
	var filterFreq = EnvGen.ar( Env.perc(0.001,duration)).linlin(0,1,200,2000);
	var tooth = Saw.ar( freq:freq, mul:gain );
	var filter = BLowPass4.ar( tooth, filterFreq, 1);
	Out.ar( 0 , (filter * ampEnv) ! 2 )
}).send;
)

z = Synth(\saw);
