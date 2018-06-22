(
SynthDef(\Pulse2, { | duration = 1.0, freq = 440, mod = 2 |
	var freqline = XLine.ar(freq , \ratio.ir(2.0) * freq, duration);
	var env = EnvGen.ar( Env.perc(duration,duration, curve:-1), doneAction:2 );
	var sig = Pulse.ar(( freqline * SinOsc.ar(freq:mod,mul:env).linlin(-1,1,0.1,rrand(0.1,30.0))).clip(2,20000),width:0.01, mul: \amp.ir(1.0));
	Out.ar(0, Pan2.ar( sig*env , \pan.ir) );
}).send;
)

(
	SynthDef(\Puk, { | duration = 0.005 , amp = 0.1, topFreq = 20000, curve = -10 |
		var freqEnv = EnvGen.ar( Env.perc(0.001,duration),doneAction:2);

	   Out.ar(0, PanAz.ar( 2, SinOsc.ar( freqEnv.linlin(0,1,20,topFreq), 0, freqEnv ), pos: 0));
	}).send;
)

Synth(\Puk,[0,0.01,1,0.1,2,1000]);


	s.options.sampleRate = 44100;
	s.reboot;

	s.scope;