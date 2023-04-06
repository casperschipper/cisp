/*

(
SynthDef(\ping,{ | duration = 1, freq = 440, pan = 0 |
	var env = EnvGen.ar(Env.sine(duration), doneAction:2);
	var sig = Pulse.ar(freq:freq,width:0.01, mul: env);
	var filtered = BLowPass.ar( sig, 100, 1) * (freq / 10).sin;
	OffsetOut.ar( 0, Pan2.ar( 
		filtered
			, pos:pan) );
}).send(s);
)

*/

(# taby (100. 200 300 400 500 10 1))

(fun a
	(line
		(seq 0 (table-cap taby))
		(st 13)))

(fun b
	(line (seq 0 (table-cap taby))
		(st 7)))

(procedure updateTable
	(# taby 
		(collect (rf 10 100) 8)))

(schedule updateTable (ch 0.1 0.5 1.0 2.0 3.0))



(sci2 
 ;freqy 
  (* 
 (index 
	taby
	(rv a b)) 1)
 ping
 
(st 1.0)

:freq (~ freqy)
:duration (st 2.0)
:pan (line (seq -1 1) 
	(t
		(ch 0.001 0.1 0.2 0.3 0.4 0.5)
		(ch 0.001 0.1 0.2 0.3 0.4 0.5)))
:wdt (t
	(ch 0.1 0.5 0.01 0.99)
	(ch 0.1 0.001 0.4 0.9 2.0))
)