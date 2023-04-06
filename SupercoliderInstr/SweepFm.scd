(
SynthDef(\sweepFM2,
{
	| duration = 0.02, freq1 = 800, freq2 = 400, ratio = 1.0, index = 1.0, pan = 0.0 |
		var freq = XLine.ar(freq1,freq2,duration,doneAction:2);
		var modFreq = freq * ratio;
		var depth = modFreq * index;
		var mod = SinOsc.ar(modFreq) * depth;
		var sig	= SinOsc.ar( freq:freq + mod );
		Out.ar(0, PanAz.ar(numChans:16, in:sig , pos:pan, level:0.01) );
}).send;
)