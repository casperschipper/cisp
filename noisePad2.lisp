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

(fun distTune
	(line
		(seq 0.0 0.0 1.0) 
		(st 5.0)))

(sci2
	noise1
	(line (seq 0.005 1.0) (line (seq 1 11) (st 13)))
	:gain (st 10)
	:densityBottom (st 0.1)
	:cutoff 
		(reset 
			(bounded-mup-walk (st 1.0) (st 3000) 
				(hold (seq 0.75 1.5) (hold (seq 1 2) (seq 3 7 11)))) (st 110) (st 20))
	:duration (line (seq 1 10) (st 10))
	:att (t (seq 0.01 1.0 3.0) (ch 3 7 5))
	:dec (st 0.1)
	:sus (st 0.5)
	:rel (st 2.0)
	:densityDecayCurve (line (seq -1 -100) (st 7))
	:rQ (line (seq 0.01 2.0) (st 7))
	)

