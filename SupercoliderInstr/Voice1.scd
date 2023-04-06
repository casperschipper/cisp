(
SynthDef(\Pulse, { | duration = 1.0 |
	var sig = Pulse.ar( \freq.ir(440), mul: \amp.ir(1.0));
	var env = EnvGen.ar( Env.perc(duration/2,duration/2, curve:0), doneAction:2 );
	Out.ar(0, Pan2.ar( sig*env , \pan.ir) );
}).send;
)

(
SynthDef(\PulseStraight, { | duration = 1.0, widthpar = 0.5 |
	var sig = Pulse.ar( \freq.ir(440),width:widthpar, mul: \amp.ir(1.0));
	var env = EnvGen.ar( Env.new([0,1,1,0],[0.000001,duration,0.000001],curve:'lin'), doneAction:2 );
	var panEnv = EnvGen.ar( Env.perc(0.0001,duration,curve:'lin'));
	Out.ar(0, PanAz.ar(numChans:21, in:sig*env , pos:(panEnv+\pan.ir(0)).wrap(-1,1) ));
}).send;
)

(
SynthDef(\voice, { | freq = 200, amp = 0.1, number = 3 |
	var duration = (1.0 / freq) * number;
	var env = EnvGen.ar( Env.new([0,pi,2*pi], [0.5*duration,0.5*duration], 'lin'), doneAction:2 );
    var ampEnv = 1.0-env.cos;
	var voice = SinOsc.ar( freq,0.25, ampEnv*amp );
	Out.ar( 0, PanAz.ar(numChans:21,in: (voice*1)*amp, pos:\pan.ir(0)) );
}).send;
)



(
SynthDef(\voicefmy, { | freq = 200, amp = 0.1, number = 3 |
	var duration = (1.0 / freq) * number;
	var env = EnvGen.ar( Env.new([0,pi,2*pi], [0.5*duration,0.5*duration], 'lin'), doneAction:2 );
    var ampEnv = 1.0-env.cos;
	var sig = SinOsc.ar( freq,0.25, ampEnv*amp*1 );
	var dist = sig.sin;
	dist = (dist+SinOsc.ar(freq/2,mul:1)).sin.clip(-1,1);
	Out.ar( 0, PanAz.ar( numChans:16, in:dist / 100, pos:\pan.ir(0)) );
}).send;
)

s.recChannels = 16;
s.prepareForRecord("/Users/casperschipper/Google Drive/Supercollider/Azimuth_Recordings/record1");


( // alternative
SynthDef(\pinkSandSynth,{
    | freq = 444, duration = 1.0, pan = 0.0, amp = 0.01, rqVal = 0.1 |
    var env = EnvGen.ar( Env( [0,1,0], [ duration / 2, duration / 2 ], [-3,-3] ), doneAction:2);
    var noise = PinkNoise.ar(1) * PinkNoise.ar(1) * PinkNoise.ar(1) * PinkNoise.ar(1) *PinkNoise.ar(1) * PinkNoise.ar(1) * PinkNoise.ar(1) * PinkNoise.ar(1) * 10000;

    var noiseBand = BPF.ar(
    BPF.ar(
    noise * 1000 * env ,freq, rq:rqVal), freq, rq:rqVal);
    Out.ar(0,PanAz.ar(8,noiseBand.clip(-1,1),pos:pan,level:amp));

}).add;
)

(
{
	var x = 	RandSeed.ir(0,2);
	var noise = Dust.ar(20000);
		var panEnv = EnvGen.ar( Env.perc(0,0.5
		,curve:'lin'),doneAction:2);
	Out.ar( 0, PanAz.ar(numChans:22, in:noise, pos:(-1*panEnv+0.2).wrap(-1,1)));
}.play;
)