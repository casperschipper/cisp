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
	(fillf 32 -1 1))

(fun a 
	(line
		(seq 0 32)
		(ch 3 5)))

(sci2
	voice
	(line (seq 0.001 0.01 0.05 0.1) (rv 0.1 0.4))
	:freq (reset (walk 300 interval) (+ shifter shifter) (weights ((1 20) (20 2) (7 1))))
	:amp (st 0.1)

	:number (line (ch 1400 4 1500) (ch 1 3 6))
	:pan (index tab1 (rv a a))
	)