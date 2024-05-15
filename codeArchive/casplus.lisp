/* 
(
SynthDef(\casplus,
{ | freq = 40, filter = 0.5, duration = 0.1, pan = 0.0 |
		var out = Pluck.ar( PinkNoise.ar(1.0), Impulse.ar(0), 0.2, 1.0 / freq, 4, filter );
		DetectSilence.ar( out, amp: 0.0001, time:0.1, doneAction:2);
	Out.ar(0, Pan4.ar(out, sin(pan * 2 *pi), cos(pan * 2 * pi)));
}).add;
)

(
SynthDef(\casplus,
{ | freq = 40, filter = 0.5, duration = 0.1, pan = 0.0, roomy = 0.5 |
		var out = Pluck.ar( Saw.ar(freq * Rand(1,2) ,0.9) + PinkNoise.ar(1.0
		), Impulse.ar(0), 0.2, (1.0 / freq * SinOsc.ar( 5, 0 , 0.03, 1)) , duration, filter );
		var galm = FreeVerb.ar( in: out, mix:0.9 ,room:roomy, damp:roomy);
		DetectSilence.ar( galm, amp: 0.0001, time:0.1, doneAction:2);
	Out.ar(0, Pan4.ar(out + galm, sin(pan * 2 *pi), cos(pan * 2 * pi)));
}).add;
)

o = Server.local.options;
o.memSize = 8192 *128;
o.dump;
o.numOutputBusChannels = 4;
o.recChannels = 4;
s.reboot;

*/

(fun a
	(line (seq 0 (table-cap OSC.table9)) (ch 5 7)))

(fun genFreqs
	(mtof
	(index
		OSC.table9
			(line (seq a a) (st 4.0)))))

(sci2
	casplus
	;thisFreq genFreqs
	(ch 1 2 3 (latch (hold (rv 0.1 0.2) (st 8)) (rv 8 12)))
	:freq (bounded-mup-walk 20 300 (ch 0.75 1.5))

	:duration  (line (seq 10.0 0.99 0.99 0.1) (ch 1 2 4 8))

	:filter (line (seq 0.99 0.99 0.999 0.95 0.4) (ch 1 2 4 8))
	:pan (line (seq (ch -1 1) (ch -1 1)) (st 4.0))
	:roomy (ch 0.5 0.5 0.5 0.5 1.0 0.1 0.1 0.1 0.2)
	)