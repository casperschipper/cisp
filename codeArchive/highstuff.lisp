/*

Noisy instrument, with looping panning 

(
SynthDef(\voicePulse, { | freq = 200, amp = 0.1, number = 3, fmIndex = 20,bibber = 20 |
	var duration = (1.0 / freq) * number;
	var env = EnvGen.ar( Env.new([0,pi,2*pi], [0.5*duration,0.5*duration], 'lin'), doneAction:2 );
    var ampEnv = 1.0-env.cos;
	var voice = SinOsc.ar( freq,0.25, ampEnv*amp ) * BPF.ar( WhiteNoise.ar() , bibber * 10, 0.01, 80);
	Out.ar( 0, PanAz.ar(numChans:21,in: (voice*fmIndex).sin* 0.1, pos:\pan.ir(0)) );
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
	(0. 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21))

(fun a 
	(line
		(seq 0 (table-cap tab1))
		(ch .1 3 5)))

(define casper 100)

(fun latcher
	(t
		(ch 2 4 8 16 32)
		(ch .1 .5 1 2))
)

(fun chooser
	(t
		(seq 0 1)
		(ch .1 .5 2)
	))

(fun resetPoint
	(t
		(ch 4000 8000 9000)
		(ch (grow 0.1 2 5))))

(fun panningSpeed
	(line
		(ch 0.001 0.1 0.3 0.01 0.05)
		(ch .5 1 2 4 8)))

(sci2
	voicePulse
	(t (ch 0.01 0.02) (ch 0.1 0.2 0.3 1.0 3.0 8.0))
	:freq 
	(wr casper
		(apply 
			(rd casper)
			(
			(|= (< 3000) resetPoint)
			(|= (> 20000) (st 5000))
			(otherwise 
				(index
					(list
						(latch (+ (rd casper) (* (ch 100 100.001 99.99) (ch -1 1))) latcher)
						(latch (* (rd casper) (ch 0.5 2.0 1.5 0.25)) latcher))
				chooser)
			))))
	:amp (st 0.1)

	:number (line (ch 1 200 1400 2000) (ch 1 3 6))
	:pan (loop (index tab1 (line (seq a a) panningSpeed)) (rv 1 8) (st 2))
	:bibber (ch 20 30 40 400 4000 16000)
	)