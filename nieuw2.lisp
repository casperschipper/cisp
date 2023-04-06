/*


(
SynthDef(\noise1, { 
	| gain = 0.5, densityBottom = 0.1, cutoff = 1000, duration = 3.0, att = 0.1, dec = 0.1, sus = 0.5, rel = 2.0, densityDecayCurve = 0, rQ = 0.01, detune = 0.0|
	var densityEnv = EnvGen.ar( Env.new([1,densityBottom],[duration], curve:densityDecayCurve));
	var panFreq = 15000;
	var sig = Dust.ar(density:densityEnv * 20000);
	var panned = Pan2.ar( sig, pos:LFNoise0.ar( panFreq ) );
	
	var detuner = 1.0 + (detune * LFNoise2.kr(0.3));
	var bPass = BBandPass.ar(panned, freq: cutoff * detuner , bw: rQ, mul: 10.0, add: 0.0);
	var hiPass = BHiPass.ar(panned, freq: cutoff * detuner, rq: rQ, mul: 1.0, add: 0.0);
	var filtered = bPass + (hiPass * 0.001);
	var env = EnvGen.ar( Env.new( [0,1,sus,sus,0], [att,dec,duration,rel] ), doneAction:2);
	var out = env * filtered * gain + (sig * 0.00);
	
	Out.ar(0,out);
}).send(s);
)

(
SynthDef(\pulse1, { 
	| gain = 0.5, pulseFreq = 3.0, squareWindowFreq = 5.0, width = 0.3, cutoff = 1000, duration = 3.0, att = 0.1, dec = 0.1, sus = 0.5, rel = 2.0, rQ = 0.01, detune = 0.0|
	var panFreq = 15000;
	var sig = Impulse.ar( pulseFreq );
	var mupped = Pulse.ar( squareWindowFreq, width ); // LFTRI on width?
	var panned = Pan2.ar( sig, pos:LFNoise0.ar( panFreq ) );
	
	var detuner = 1.0 + (detune * LFNoise2.kr(0.3));
	var bPass = BBandPass.ar(panned, freq: cutoff * detuner , bw: rQ, mul: 10.0, add: 0.0);
	var hiPass = BHiPass.ar(panned, freq: cutoff * detuner, rq: rQ, mul: 1.0, add: 0.0);
	var filtered = bPass + (hiPass * 0.001);
	var env = EnvGen.ar( Env.new( [0,1,sus,sus,0], [att,dec,duration,rel] ), doneAction:2);
	var out = env * filtered * gain + (sig * 0.00);
	
	Out.ar(0,out);
}).send(s);
)

(
SynthDef(\pulse1, { 
	| gain = 0.5, pulseFreq = 3.0, squareWindowFreq = 5.0, width = 0.3, cutoff = 1000, duration = 3.0, att = 0.1, dec = 0.1, sus = 0.5, rel = 2.0, rQ = 0.01, detune = 0.0|
	var panFreq = 10;
	var sig = Impulse.ar( pulseFreq );
	var mupped = sig * Pulse.ar( squareWindowFreq, width ).linlin(-1,1,0.3,1); // LFTRI on width?
	var panned = Pan2.ar( mupped, pos:LFNoise1.ar( panFreq ) );
	
	var detuner = 1.0 + (detune * LFNoise2.kr(0.3));
	var bPass = BBandPass.ar(panned, freq: cutoff * detuner , bw: rQ, mul: 10.0, add: 0.0);
	var hiPass = BHiPass.ar(panned, freq: cutoff * detuner, rq: rQ, mul: 1.0, add: 0.0);
	var filtered = bPass + (hiPass * 0.001);
	var env = EnvGen.ar( Env.new( [0,1,sus,sus,0], [att,dec,duration,rel] ), doneAction:2);
	var out = env * filtered * gain + (sig * 0.00);
	
	Out.ar(0,out.clip(-1.0,1.0));
}).send(s);
)

*/



(~ timert
	(line (seq 0.04 0.06) (line (seq 1 7) (st 13))))

(~ spacer
	(line (seq 0.25 0.75) (st 11)))



(sci2
	pulse1
	(~ timert)
	:gain (st 1)
	:pulseFreq (* (beat 83.35 1) (floor (ch 100 101 99 50 25)))
	:squareWindowFreq (ch 100 200)
	:width (ch 0.3 0.5 0.9)
	:cutoff 
		(reset 
			(bounded-mup-walk (st 50.0) (st 20000) 
				(ch (/ 1 (~ spacer)) (~ spacer))) (ch 220 440 660) (line (seq 2 100) (st 33)))
	:duration (clip (/ 0.1 (~ timert)) 1 5)
	:att (line (seq 0.1 5.0) (ch 3 7 5))
	:dec (st 0.1)
	:sus (st 1.0)
	:rel (st 5)
	:rQ (line (seq 0.01 0.1) (st 7))
	:detune (line (seq 0.0 0.001 0.1 0.4) (ch 3 5 7))
	)

