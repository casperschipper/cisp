(
SynthDef(\ping,
	{ | freq, amp, duration, filtmup |
		var sig, f, env, ffreq, pink, fenv;

		freq = freq * Rand(0.999,1.001);

		sig = 0.1 *(Saw.ar(7.collect(rrand(0.99,1.01)) * freq) + Saw.ar(7.collect(rrand(0.99,1.01)*freq*1.5,mul:1)) ;
		env = EnvGen.ar( Env.perc(0.0001,duration), doneAction:2);
		fenv = EnvGen.ar( Env.perc(0.0001, duration * 1.0 , curve:-1) );

		ffreq = ((fenv* freq * 8.0).midicps).clip(20,20000);

		f = BLowPass4.ar( sig*env, ffreq, rq:2);

		Out.ar(0, (f * env * 0.1) ! 2);
}).add;
)

s.scope;
s.boot;


z = Synth(\ping, [\freq, rrand(40,52).midicps,\amp,1.0, \duration, 5.0]);

s.scope;

