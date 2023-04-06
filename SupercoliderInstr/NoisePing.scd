~noiseBuf = Buffer.alloc(s,441000,1);
~noiseBuf.loadCollection( 441000.collect( {1.0.rand2;} ));
~noiseBuf.plot;

(
SynthDef(\NoisePing,
	{| bufnum = 0,duration = 0.1,start = 0, freq = 440,bw = 1.0,pany = 0.0, panx = 0.0, wet = 1.0|
		var env = EnvGen.ar( Env.perc(0.0001,duration,curve:-1));
		var envT = EnvGen.ar( Env.perc(0.0001, duration * 1.5), doneAction:2);
		var sound = PlayBuf.ar(1, bufnum, rate:1.0,rate:1.0, loop:1,startPos:start) * env;
		var filtered = BPF.ar( sound , freq, bw );
		var dry = 1.0 - wet;
		Out.ar( 0, Pan4.ar(
			(filtered * ( 0.01 / bw ) * wet) +
			(sound * (dry*0.01)) , xpos:panx, ypos:pany).tanh);
}).send(s);
)

s.reboot;

s.meter;

z = Synth(\NoisePing,[\freq,rrand(20,8000)]);