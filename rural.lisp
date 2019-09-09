/* 
(
SynthDef(\ping,
	{ | freq, amp, duration |
		var sig, f, env, ffreq;
		
		sig = Saw.ar(freq);
		env = EnvGen.ar( Env.perc(0.0001,duration), doneAction:2);
		
		ffreq = (((env * freq) * 2.0)+200).clip(20,20000);
		
		f = Resonz.ar ( Resonz.ar ( sig * env , ffreq, 2.0 ), ffreq, 2.0 );
		
		Out.ar(0, f ! 2);
}).add;
)

z = Synth(\ping, [\freq, rrand(40,52).midicps,\amp,1.0, \duration, 5.0]);

*/

(fun fourty
	(hold (seq 40 42 33)
		(seq 1 (seq 1 2 (ch 2 3) 2))))



(fun fiftytwo
	(hold (seq 52 (seq 57 56))
		(seq (ch 2 3) 5)))

(fun foo
	(hold
		(seq 47 49 44)
		(seq 1 1 1 2)))

(fun bar 
	(hold
		(* (ch 0 1 -1) 7)
		(ch 13 17)))



(clone
(sci2
	ping
	(* (seq 0.14 0.13) 0.8)
	:freq (mtof 
		(+ (hold 
			(seq fourty foo fiftytwo)
			(seq 2 3)) bar))
	:duration (line (seq 0.1 2) (ch 17 23))
	:filtmup (seq (line (seq 0.01 0.9) (ch 27 29)) (line (seq 0.1 1.0) (ch 27 29)))
	) 2)