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
		(ch 10000 20000)
		(ch .1 .5 1 2))
)

(fun chooser
	(t
		(seq 0 0 0 0 0 1)
		(ch .1 .5 4 3)
	))

(fun panoffset
	(line
		(seq 0 21)
		(ch 1 2 5 7 11)))

(fun panrange
	(line
		(seq 0 0.3)
		(ch 1 2 5 7 11)))

(fun depthctrl
	(t
		(seq 0 100 3 0.4 55)
		(ch 1 2 4 7 11)))

(fun bottom
	(t
		(ch 10 1000 2000 5000 10000)
		(ch 1 2 3 7 11)))

(fun numberGrow
	(line
		(seq 10 40 400 10)
		(fractRandTimer (ch 0.01 0.1 0.9 2.0))))

(sci2
	voice
	(fractRandTimer (line (hold (ch 0.0002 0.001 0.02 0.03 0.4) (ch 1 2 2 2 2 2 2)) (ch 0.1 0.2 0.5 1.0)))
	:freq 
	(wr casper
		(apply 
			(rd casper)
			(
			(|= (< bottom) (st 10000))
			(|= (> 20000) (st 10000))
			(otherwise 
				(index
					(list
						(latch (+ (rd casper) (line (seq -1000 1000) (hold (ch 0.01 0.001 0.002 0.1 0.2 0.01 0.4) (st 3)))) latcher)
						(latch (* (rd casper) (ch 0.5 1.5 0.75 0.9 1.5 1.2)) latcher))
				chooser)
			))))
	:amp (st 0.1)

	:number (line numberGrow (ch 1 3 6))
	:pan (+ panoffset (line (seq 0 panrange) (t (ch 0.001 0.1 0.2 0.4) (ch 1 2 4))))
	:depth (seq depthctrl depthctrl depthctrl)
	)