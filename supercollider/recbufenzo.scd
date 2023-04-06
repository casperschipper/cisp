b = Buffer.alloc(s,44100*3,1);

(
SynthDef(\recbuf, { | buffer |
	RecordBuf.ar(SoundIn.ar(0,1),buffer,loop:1.0);
}).send(s);
)

s.meter;

(
SynthDef(\playbuf, { | buf, speed = 1.0, |
	Out.ar(0,PlayBuf.ar(1,buf,speed,loop:1.0));
}).send(s);
)

(
SynthDef(\playbuf2, { | bufnum, start, loopsize, dur = 1.0, rate = 1.0 |
	var trig = Impulse.ar(0.1);
	var end = start + loopsize;
	var phase = Phasor.ar(trig,BufRateScale.ir(bufnum)*rate,start,end);
	var sig = BufRd.ar(1,bufnum,phase,loop:1);
	var env = EnvGen.ar(Env.new([0,1,0],[0.05,dur,0.05]),doneAction:2);
	Out.ar(0,(sig * env) ! 2);
}).send(s);
)

s.freeAll;

x = Synth(\recbuf, b.bufnum);
y = Synth(\playbuf2,[\bufnum,b.bufnum,\start,0.0,\loopSize,44100.0,\rate,2.0,\eventDur,1.0]);
y.free;
b.plot;

(
{
	Out.ar(0,SoundIn.ar(0,1));
}.play
)

s.scope;

s.free(

b.plot;

s.plotTree;

s.freeAll;

s.options.inspect;