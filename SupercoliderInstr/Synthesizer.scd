(
SynthDef(\ping,
	{ | freq, amp, duration, filtmup |
		var sig, f, env, ffreq, pink, fenv;

		freq = freq * Rand(0.999,1.001);

		sig = Saw.ar([freq,freq*2,freq*3]) + SinOsc.ar(freq/1,mul:1);
		env = EnvGen.ar( Env.perc(0.0001,duration), doneAction:2);
		fenv = EnvGen.ar( Env.perc(0.0001, duration * 0.6 , curve:-1) );

		ffreq = ((fenv* freq * 8.0)+(128*filtmup).midicps).clip(20,20000);

	    pink = [ PinkNoise.ar(0.1) * env * env, PinkNoise.ar(0.1) * env * env];

		pink = LPF.ar(pink, 100);

		f = BLowPass4.ar( sig+pink*env, ffreq, rq:2);

		Out.ar(0, (f * env * 0.1) ! 2 + pink);
}).add;
)

s.scope;



z = Synth(\ping, [\freq, rrand(40,52).midicps,\amp,1.0, \duration, 5.0]);

s.scope;

