/*
(
SynthDef( \gamPing, { | freq = 440,duration = 0.1,gain = 0.1,pos = 0 |
var env = EnvGen.ar(Env.perc(0.001,duration,gain,-2),doneAction:2);
	var tone = Saw.ar([freq.abs,(freq*(4.0/1.99)).abs,(freq * 1.5).abs]).sum*env;
var filtered = MoogFF.ar(
tone,
EnvGen.ar( Env.perc(0.001,duration,1,-4)).linlin(0,1,100,9000), 0.1 );
filtered = LeakDC.ar( filtered );
Out.ar(0, Pan2.ar(filtered,pos) );
}).send;
)
*/

(fun step2
	(hold
		(seq 1)
		(ch 1 2 1 3 1 1 1 1 1 )))

(sync 0.28)

(fun mupper 
	(hold (ch 0.5 2.0) (ch 4 8 16 44)))

(~ changingDiff
	(t (ch 80 100 200) (ch 0 0.1 13 33 8 7)))

(sci2
	gamPing
	(seq 0.15 0.13)
	:freq (* (reset (bounded-walk 25 20000 step2) (st 50) (hold (seq 7 9 11 12 7) (ch 1 1 1 1 1 1 1 1 2))) mupper)
	:duration (* (mtof (slider 1 :d 64)) 0.005)
	:gain (seq 0.1 0.1 0. 0.1 0.1 0 0.1 0.1 0.1 0.)
	:pos (loop (seq -1 0 1) (st 2) (st 10))
	:attack (* (mtof (slider 2 :d 64)) 0.001)
	)