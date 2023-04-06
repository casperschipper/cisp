/*
(
SynthDef(\voice, { | freq = 200, amp = 0.1, number = 3 |
	var duration = ((1.0 / freq) * number).clip( lo: 0.1, hi: 10);
	var env = EnvGen.ar( Env.new([pi,2*pi], [duration], 'lin'), doneAction:2 );
    var ampEnv = 1.0-env.cos;
	Out.ar( 0, PanAz.ar(numChans:16,in:SinOsc.ar(freq:freq, width:0.25, mul:ampEnv ).sin, pos:\pan.ir(0),level:amp) );
}).send;
)
*/

(fun interval
	(t
		(ch 1 2 3)
		(ch .1 .5)))

(fun shifter
	(line
		(rv 100 100)
		(ch .1 0.01 4 7)))

(fun a 
	(line
		(seq 0 128)
		(ch 7 5)))

(fun indexer 
	(line
		(seq 0 8)
		(seq 15 17 5)))

(sci2
	voice
	(line (seq 0.1 0.2) (rv 0.1 0.4))
	:freq (reset (walk 25 (index (25. 25.01 50 24.01 25.1 26 100 -99) indexer)) (st 100) (st 40))
	:amp (st 0.05)

	:number (line (seq 1000 500 2 1) (ch 1 3 6))
	:pan (index OSC.table1 (rv a a))
	)