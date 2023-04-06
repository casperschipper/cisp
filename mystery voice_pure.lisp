/*

THIS IS SPRINCLES


(
SynthDef(\voice, { | freq = 200, amp = 0.1, number = 3 |
	var duration = (1.0 / freq) * number;
	var env = EnvGen.ar( Env.new([0,pi,2*pi], [0.5*duration,0.5*duration], 'lin'), doneAction:2 );
    var ampEnv = 1.0-env.cos;
	var voice = SinOsc.ar( freq,0.25, ampEnv*amp );
	Out.ar( 0, PanAz.ar(numChans:21,in: (voice*1).sin* 0.1, pos:\pan.ir(0)) );
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
		(ch 10 20 50)
		(ch .1 .5 1 2))
)

(fun chooser
	(t
		(seq 0 1)
		(ch .1 .5 2)
	))

(sci2
	voice
	(t (ch 0.01) (ch 0.1 0.2 0.3 1.0 3.0 8.0))
	:freq 
	(wr casper
		(apply 
			(rd casper)
			(
			(|= (< 100) (bounded-walk 100 1000 (ch -100 100)))
			(|= (> 20000) (bounded-walk 100 1000 (ch -100 100)))
			(|= (> 0) 
				(index
					(list
						(latch (+ (rd casper) (* (rd casper) (ch -0.5 -0.25 0.5 0.25 0.1))) latcher)
						(latch (* (rd casper) (ch 1.5 0.66666666666667)) latcher))
				chooser)
			))))
	:amp (st 0.1)

	:number (line (ch 1000 1400 1600) (ch 1 3 6))
	:pan (loop (line (seq -1 1) (ch .1 .5 2)) (ch 2 4) (ch 2 1 3 3 3))
	)