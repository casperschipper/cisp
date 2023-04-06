(fun tones (start len)
	(reset 
		(walk 100 (st 100)) start (hold (seq 5 7) len)))

100 200 300 400 500 
/
1 2 3 4 5 l

(sci2 sax
	(st 0.14)
	:freq 
		(/ 
			(tones (tones (st 100) (st 11)) (st 13))
			(reset 
			(walk 1 (st 1)) (st 1) (hold (seq 5 7 9) (st 17))))
	:duration (st 10)
	:amp (st 1.0)
	:attack (st 0.1)
	:filterf (mtof (line (seq 80 136) (st 10)))
	:pan (line (seq -1 1) (st 0.03)))


/* 

(
SynthDef(\sax, {
	| freq = 220
	, duration = 5.0
	, attack = 0.25
	, gain = 0.1
	, lfospeed = 20
	, lfonoisy = 0.001
	, filterf = 5000
	, pan = 0.0|
	var freq2 = freq * LFNoise2.ar(lfospeed,mul:lfonoisy,add:1.0);
	var attackT = attack * duration;
	var sig = Pulse.ar( freq2, 0.5 ) + Saw.ar( freq );
	var env = EnvGen.ar( Env.new( [0, 1, 0], [attackT, duration-attackT, attackT], \sine), doneAction:2);
	//var filt = BPlowPass.ar( in: env * sig, filterf * env, 2 );
	var filt = BLowPass.ar(in:env * sig, freq: filterf * env, rq: 0.9, mul: 1.0, add: 0.0);

	Out.ar( 0, Pan2.ar( filt, pan) );
}).add;


)
*/