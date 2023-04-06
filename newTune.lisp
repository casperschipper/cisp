/*


SynthDef(\noise1, { 
	| gain = 0.5, densityBottom = 0.1, cutoff = 1000, duration = 3.0, att = 0.1, dec = 0.1, sus = 0.5, rel = 2.0, densityDecayCurve = 0, rQ = 0.01|
	var densityEnv = EnvGen.ar( Env.new([1,densityBottom],[duration], curve:densityDecayCurve));
	var panFreq = 10000;
	var sig = Dust.ar(density:densityEnv * 20000);
	var panned = Pan2.ar( sig, pos:LFNoise0.ar( panFreq ) );
	var filtered = BHiPass.ar(panned, freq: cutoff, rq: rQ, mul: 1.0, add: 0.0);
	var env = EnvGen.ar( Env.new( [0,1,sus,sus,0], [att,dec,duration,rel] ), doneAction:2);
	var out = env * filtered;
	
	Out.ar(0,out);
}).send(s);
)


Synth(\noise1);
*/



(~ timert
	(line (seq 0.01 3.0) (line (seq 1 7) (st 13))))

(sci2
	noise1
	(~ timert)
	:gain (st 3)
	:densityBottom (t (seq 0.001 0.1) (seq 7 11 5))
	:cutoff 
		(reset 
			(bounded-mup-walk (st 50.0) (st 20000) 
				(ch 0.666667 1.5)) (ch 110 660 440) (st 50))
	:duration (clip (/ 3 (~ timert)) 0 20)
	:att (line (seq 0.1 5.0) (ch 3 7 5))
	:dec (st 0.1)
	:sus (st 1.0)
	:rel (st 5)
	:densityDecayCurve (line (seq -1 -30) (st 7))
	:rQ (line (seq 0.01 0.1) (st 7))
	:detune (line (seq 0.0 0.001 0.1 0.4) (ch 3 5 7))
	)

