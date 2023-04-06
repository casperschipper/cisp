(fun freq (bounded-mup-walk (st 20) (st 20000) (ch 0.5 1.5 2.0 0.666666667) 400))

(sci2
	voice
	(st 0.01)
	:freq (seq freq freq freq freq)
	:duration (line (seq 1 5) (ch 3 8))
	:amp (st 0.01)
	:pan (st 0))

	/*

	(
SynthDef(\voice,
{ | freq, amp, duration, pan |
	var sig = SinOsc.ar( freq: freq, mup:amp );
    var env = EnvGen.ar ( Env.new([0,1,1,0],[0.001,duration,0.001]), doneAction:2);
    Out.ar( 0, PanAz.ar( numChans:4, in:sig*env * amp , pos:pan ));
}).add;
)
*/ 

VOICE INSTRUMENT