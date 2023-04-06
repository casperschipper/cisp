/*

THIS IS SPRINCLES


(
SynthDef(\voice, { | freq = 200, amp = 0.1, number = 3 |
	var duration = (1.0 / freq) * number;
	var env = EnvGen.ar( Env.new([0,pi,2*pi], [0.5*duration,0.5*duration], 'lin'), doneAction:2 );
    var ampEnv = 1.0-env.cos;
	var voice = SinOsc.ar( freq,0.25, ampEnv*amp );
	Out.ar( 0, PanAz.ar(numChans:21,in: (voice*100).sin* 0.1, pos:\pan.ir(0)) );
}).send;
)


*/

(fun interval
	(t
		(ch 1 2 3 55 700 -3 -100 -20)
		(ch .1 .5)))

(fun shifter
	(line
		(rv 300 700)
		(ch .1 0.01 4 7)))

(# tab1
	(fillf 32 -1 1))

(fun a 
	(line
		(seq 0 (table-cap tab1))
		(ch .1 3 5)))

(define casper 100)

(fun latcher
	(t
		(ch 100 200 1000)
		(ch .1 .5 1 2))
)

(fun chooser
	(t
		(seq 1 1 1 1)
		(ch .1 .5 4 3)
	))

(sci2
	voice
	(t (ch 0.1 0.2 0.3 0.05 0.14) (ch 0.1 0.2 0.3 1.0 3.0 8.0))
	:freq 
	(wr casper
		(apply 
			(rd casper)
			(
			(|= (< 50) (st 500))
			(|= (> 20000) (st 5000))
			(otherwise 
				(index
					(list
						(latch (+ (rd casper) (ch -10 10 20)) latcher)
						(latch (* (rd casper) (ch 0.5 2.0 0.75 1.5 2.9)) latcher))
				chooser)
			))))
	:amp (st 0.1)

	:number (line (ch 50 30 ) (ch 1 3 6))
	:pan (index tab1 (rv a a))
	)