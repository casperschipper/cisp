(
SynthDef(\recBuf,{ | bufnum |
	var in = [SoundIn.ar( 6 ), SoundIn.ar( 7 )];
	RecordBuf.ar( in , bufnum,0,loop:1);
}).send(s);
)

s.queryAllNodes;

(
var fun = { | buffer |
	z = Synth(\recBuf,[\bufnum,buffer]);
	z.postln;
};


~mem = Buffer.alloc(s,44100*120,2,completionMessage:fun);
)

(
SynthDef
    (\loopPlay,
{
    | start = 0, duration = 1.0, gain = 0.1,freq = 1 |
	var sig = PlayBuf.ar( 2,4,rate:freq, startPos:start, loop:1);
		var env = EnvGen.ar( Env.new([0,1,1,0],[0,duration,0]),doneAction:2);
	Out.ar( 4, sig*env );
}
).send(s);
)


~mem.plot;
a = Synth(\loopRec);






)

(
o = s.options;
o.outDevice = "Fireface UC Mac (23808670)";
o.inDevice = "Fireface UC Mac (23808670)";
o.numInputBusChannels = 8;
o.numOutputBusChannels = 8;
s.reboot;
)

		