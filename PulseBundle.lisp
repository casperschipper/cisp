/*

(
SynthDef(\ping,{ | duration = 1, freq = 440, pan = 0 |
	var env = EnvGen.ar(Env.sine(duration), doneAction:2);
	OffsetOut.ar( 0, Pan2.ar( Pulse.ar(freq:freq,width:0.01, mul: env *(freq / 10)).sin, pos:pan) );
}).send(s);
)

*/

(fun glot
	(line
		(seq 1000 10000)
		(ch 33 17 11)))

(fun a
	(line
		(seq 0 12)
		(ch 1 2 4 8 12)))

(fun b
	(line (seq 0 12)
		(ch 1 2 4 8 12)))

(sci2 
 ;freqy 
  (* 
 (index 
	(list 100 300 1000 5000 222 55 20 3000 9000)
	(rv a b)))

 ping
 
(t (/ 1.0 (rf -10 30)) (/ 1 (rf 1 40)))
:freq (~ freqy)
:duration (/ 3.0 (~ freqy))
:pan (line (seq -1 1) 
	(t
		(ch 0.001 0.1 0.2 0.3 0.4 0.5)
		(ch 0.001 0.1 0.2 0.3 0.4 0.5)))
)