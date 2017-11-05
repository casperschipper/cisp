/*
~buffer = Buffer.read(s, "/Users/casperschipper/Google Drive/Angel Arranz - Bilbao/SERRAPHONIE 7 takes/animal_06_edit.aiff");

~buffer.bufnum;
(
SynthDef( \simpleBuf, {
	| bufnummer = 0, start = 0, ratio = 1.0, sustainTime = 1.0, amp = 0.1, attack = 0.01, decay = 0.01, pan = 0.0, pan2 = 0.0 |
	var duration = sustainTime + attack + decay;
	var sr = SampleRate.ir;
	var sampsLength = (duration * sr) * ratio; // duration in seconds x samplerate x transposition
	
	var startSamp = start * sr; // start sample
	var endSamp = startSamp + sampsLength; 
	
	var index = EnvGen.ar( Env([startSamp, endSamp], [duration] ) );
	var sig = BufRd.ar( 1, ~buffer.bufnum, phase:index, loop:1, interpolation:2);
	var env = EnvGen.ar( Env([0,1,1,0],[attack,sustainTime,decay], curve:[-2,-5]),doneAction:2);

	var panned = Pan4.ar( sig * env * amp , pan, pan2 );
	Out.ar( 0, panned );
}).add;
)

o = s.options;
o.numOutputBusChannels = 4;


*/


(fun mask 
	(line (seq -1 1) (ch 1 3 5)))

(clone
(sci2 
	simpleBuf
	(/ 1.0 (line (seq 500 1) (ch 0.1 0.2 1 4 8)))
	:bufnummer (st 0)
	:start (line (seq (rv 0 50) 50.0) (ch 1 50 100))
	:amp (st 0.05)
	:attack (st 0.05)
	:decay (st 0.1)
	
	:sustainTime (st 0.0)
	:ratio (ch (line (ch 0.5 1.0) (st 73)) 1. (line (ch 2.0 2.1) (st 94)) (line (ch 2.0 3.1) (st 45)) (line (ch 4.0 8.1) (st 70)))
	:pan (rv mask mask)
	:pan2 (rv mask mask)
	)
3)