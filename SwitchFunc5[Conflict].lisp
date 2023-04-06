/* 
(
SynthDef(\sine, {
	| freq = 220, amp = 0.1,  duration = 1.0, pan = 0.0 |
	var env = EnvGen.ar( Env.new([0,1,1,0],[0.0,duration,0.0]), doneAction:2 );
	Out.ar( 0, Pan2.ar( SinOsc.ar( freq:freq, mul: env ), pos:pan, level:amp) );
}).add;
)

z = Synth(\sine);

1000.cpsmidi;

(fun pattern
	(seq
		(latch (st 1) (seq 3 2 1 2))
		(latch (st 0) (st 1))))

1 0 1 0

*/

(fun switchFlip (a b)
	(index (list a b)
		(>
			(rv 0 1000)
			(line 
				(seq 0 1000)
				(ch .1 .2 .4 .8 1.6)))))

(fun controller2
	(t 
		(ch 30 100)
		(ch 3 5 7)))

(fun controller
	(line 
		(seq controller2 60 0)
		(ch 3 5)))



(fun casper
	(line
		(hold
			(rf (st 60) controller)
			(st 2))
		(ch .1 )))

(fun heavy
	(mtof
		(line
			(seq 0 84)
			(ch .1 .4 .8 1.6 3.2 6.4))))

(clone
	(sci2
	sine
	(seq 0 0 0 (/ (st 5.0) (switchFlip 
		(switchFlip (switchFlip casper  casper)  casper)
	    (switchFlip casper  casper))))
	:freq (* (switchFlip 
		(switchFlip (switchFlip casper  casper)  casper)
	    (switchFlip casper  casper)) (seq 1.0 2.0 3.0 4.0 true))

	:duration (/ heavy (switchFlip 
		(switchFlip (switchFlip casper  casper)  casper)
	    (switchFlip casper  casper)))
	:amp (st 0.05)
	:pan (t (rv -1 1) (st 40)))
	5)

1 1 1 0 1 1 0 1 0 1 1 0

