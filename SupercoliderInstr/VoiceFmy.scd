(
a = 22.collect({4+rrand(0,0.03)});

{
	Out.ar(0, Impulse.ar( a ) );
}.play;
)

(
SynthDef(\voicefmy, { | freq = 200, amp = 0.1, number = 3 |
	var duration = (1.0 / freq) * number;
	var env = EnvGen.ar( Env.new([0,pi,2*pi], [0.5*duration,0.5*duration], 'lin'), doneAction:2 );
    var ampEnv = 1.0-env.cos;
	var sig = SinOsc.ar( freq,0.25, ampEnv*amp*100 );
	var dist = sig.sin;
	dist = (dist+SinOsc.ar(freq/2,mul:100)).sin.clip(-1,1);
	Out.ar( 0, PanAz.ar( numChans:16, in:sig / 100, pos:\pan.ir(0)) );
}).send;
)