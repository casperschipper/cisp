/*
(
SynthDef( \ping, { | freq = 440,duration = 0.1,gain = 0.1,pos = 0 |
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
		(ch (rv 100 200) 200 150 133.3333)
		(ch 1 4 8 3)))

(sync 0.28)

(fun mupper 
	(hold (ch 0.5 2.0) (ch 4 8 16 44)))

(~ changingDiff
	(line (ch 80 100 90 110 100 100 100 100 100) (ch 0 0.1 13 33 8 7)))

(sci2
	ping
	(seq 0.15 0.13)
	:freq (* (reset (bounded-walk 25 20000 (~ changingDiff)) (st 100) (hold (seq 2 3 4 2 7) (ch 1 1 1 1 1 1 1 1 2))) mupper)
	:duration (* (seq 0.1 0.1 0.1 0.4 0.1 0.8 0.4 0.1 0.1 0.8 0.1 0.1 1.5) (hold (seq 1 .1 1.5 2 2 3 1 .1 3) (ch 4 8 7 11)))
	:gain (st 0.1)
	:pos (loop (series -1 0 1) (st 2) (st 10))
	)