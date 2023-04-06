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
THISIS THE VOICE
(
SynthDef(\voice, { | freq = 200, amp = 0.1, number = 3 |
	var duration = (1.0 / freq) * number;
	var env = EnvGen.ar( Env.new([0,pi,2*pi], [0.5*duration,0.5*duration], 'lin'), doneAction:2 );
    var ampEnv = 1.0-env.cos;
	Out.ar( 0, PanAz.ar( numChans:16, in:SinOsc.ar( freq,0.25, ampEnv*amp ), pos:\pan.ir(0)) );
}).send;
)


(
SynthDef(\voicefmy, { | freq = 200, amp = 0.1, number = 3 |
	var duration = (1.0 / freq) * number;
	var env = EnvGen.ar( Env.new([0,pi,2*pi], [0.5*duration,0.5*duration], 'lin'), doneAction:2 );
    var ampEnv = 1.0-env.cos;
	var sig = SinOsc.ar( freq,0.25, ampEnv*amp*100 );
	var dist = sig.sin;
	dist = (dist+SinOsc.ar(freq/2,mul:100)).sin.clip(-1,1);
	Out.ar( 0, PanAz.ar( numChans:16, in:dist / 100, pos:\pan.ir(0)) );
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
	(sine 32 (1.0)))

(fun a 
	(line
		(seq 0 (table-cap tab1))
		(ch .1 3 5)))

(define casper 100)

(fun latcher
	(t
		(ch 10 5 4 100)
		(ch .1 .5 1 2))
)

(fun chooser
	(t
		(seq 0 1)
		(ch .1 .5 4 3)
	))

(sci2
	voicefmy

	(t (seq (rv 0.01 0.05) (rv 0.05 0.07)) (ch 3 4 5))
	:freq 
	(wr casper
		(apply 
			(rd casper)
			(
			(|= (< 10) (st 5000))
			(|= (> 20000) (st 5000))
			(otherwise 
				(index
					(list
						(latch (+ (rd casper) (ch 0 -50 100 200)) latcher)
						(latch (* (rd casper) (ch 0.5 1.0 2.0 1.5 0.75)) latcher))
				chooser)
			))))
	:amp (st 0.1)

	:number (line (ch 50 100 70 30 200 1200) (ch 1 3 6))
	:pan (index tab1 (rv a a))
	)