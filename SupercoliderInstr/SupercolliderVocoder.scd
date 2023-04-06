(
var freqs = 60.collect({|i| 20*2.pow(i/6.0) });
freqs.last.postln;

SynthDef(\vocoder,{ | filterQ = 0.1, gain = 1.0 |
	var in = PlayBuf.ar( 1, ~myBuff, 1.0, loop:1);
	var in2 = Saw.ar(LFNoise2.ar(20,40,40).midicps);
    var array = Amplitude.ar( BPF.ar( in, freqs, filterQ ), 0.1, 0.1 );
	var array2 = BPF.ar( in2, freqs, filterQ, array );
	Out.ar(0, array2.sum * gain);
}).send
)
s.meter;
y = Synth(\vocoder,[\filterQ,0.1,\gain,1.0]);

(
~myBuff = Buffer.read(s, );
)


y.free;


s.reboot;


	