/*
(
SynthDef(\voice, { | freq = 200, amp = 0.1, number = 3 |
	var duration = (1.0 / freq) * number;
	var env = EnvGen.ar( Env.new([0,pi,2*pi], [0.5*duration,0.5*duration], 'lin'), doneAction:2 );
    var ampEnv = 1.0-env.cos;
	Out.ar( 0, Pan2.ar( SinOsc.ar( freq,0.25, ampEnv ), pos:\pan.ir(0)) );
}).send;
)

(
SynthDef(\voice, { | freq = 200, amp = 0.1, number = 3 |
	var duration = (1.0 / freq) * number;
	var env = EnvGen.ar( Env.new([0,pi,2*pi], [0.5*duration,0.5*duration], 'lin'), doneAction:2 );
    var ampEnv = 1.0-env.cos;
	Out.ar( 0, Pan2.ar( SinOsc.ar( freq,0.25, ampEnv*1 ).sin, pos:\pan.ir(0),level:amp) );
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
	(sine 16 (1.0)))

(fun a 
	(line
		(seq 0 (table-cap tab1))
		(ch .1 3 5)))

(define casper 100)

(fun latcher
	(t
		(ch 10 20 100)
		(ch .1 .5 1 2))
)

(sci2
	voice
	(line (seq 0.01 0.1) (ch 1.0 3.0 8.0))
	:freq 
	(wr casper
		(apply 
			(rd casper)
			(
			(| (< 10) (+ 100))
			(|= (> 10000) (st 100))
			(otherwise 
				(seq
					(latch (+ (rd casper) (ch 100 99 101)) latcher)
					(latch (* (rd casper) (ch 2.0 0.5)) latcher)))
			)))
	:amp (st 0.1)

	:number (line (ch 1000) (ch 1 3 6))
	:pan (index tab1 (rv a a))
	)