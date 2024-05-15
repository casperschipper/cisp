/*
 * Instrument
 
 This is an organ like instrument
 
 (
SynthDef(\casper, { | midi = 60  , velo = 60, dur = 1.0, pos = 0.0 |
	var gain = 1.0 * (velo.linlin(0,128,-60,0).dbamp );
	var freq = midi.midicps;
	
	var sig = SinOsc.ar( [freq * 0.5, freq * 0.25, freq,freq*2.01,freq*3.99,freq*8.02, freq * 16.032, freq *31.99], mul: gain );
	var env = EnvGen.ar( Env.perc( 0.0001, dur ), doneAction:2);
	var vca = (sig.sum) * env;
	var filt = Resonz.ar( in:vca, freq:EnvGen.ar( Env.new([128,40],[dur],curve:[-8])).midicps,bwr:1.3);
	Out.ar( 0, Pan2.ar( filt.clip(-0.5,0.5), pos));
}).add;
)

 */


(fun patty (pindex)
	(index
			(list
				(st 1)
				(seq 1 2)
				(seq 3 2 3 1)
				(rv 1 7)
				(seq 2 2 2 3 3)
				(seq 4 5)
				(seq (ch 2 3) (ch 1 3))
				(seq (ch 1 9) (ch 1 2)))
				(/ pindex 8)))

(sync (beati 120 4))

(sci2
	casper
	(beat 120 4)
	:midi (hold 
		(+ 36 (list-walk (12 9 7 5 2 0) (sometimes -3 1 10)))
		(seq 
			(patty (slider 3 1 0))
			(patty (slider 3 1 1))
			(patty (slider 3 1 2))))
	:dur (hold (seq 0.8 1.2 0.3) (list-walk (list 2 3) (slider 3 1 3)))
	:velo (st 100)
	:pos (st 1))








