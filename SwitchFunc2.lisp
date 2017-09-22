/* 
(
SynthDef(\sine, {
	| freq = 220, amp = 0.1,  duration = 1.0, pan = 0.0 |
	var env = EnvGen.ar( Env.perc( 0.2 , duration), doneAction:2 );
	Out.ar( 0, Pan2.ar( Saw.ar( freq:freq, mul: env ), pos:pan, level:amp) );
}).send(s);
)

*/

(fun switchFlip (a b)
	(index (list a b)
		(>
			(rv 0 1000)
			(line 
				(seq 0 1000)
				(ch .1 .2 .4 .8 1.6)))))

(fun casper
	(line
		(hold
			(rf 30 128)
			(st 2))
		(ch 0. .2 .3 5 7)))

(clone
	(sci2
	sine
	(/ (st 1.0) (switchFlip 
		(switchFlip (switchFlip casper  casper)  casper)
	    (switchFlip casper  casper)))
	:freq (switchFlip 
		(switchFlip (switchFlip casper  casper)  casper)
	    (switchFlip casper  casper))

	:duration (st 0.15)
	:amp (st 0.01)
	:pan (t (rv -1 1) (st 40)))
	5)

