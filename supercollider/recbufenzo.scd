Server.killAll;
s.boot;

Server.supernova;
s.options.memSize_(8192*4);
s.plotTree;

s.device =

Server.options.devices;

b = Buffer.alloc(s,100000,1);
b.plot;
b.bufnum;
a = Bus.audio(s,1);
s.meter;
(
SynthDef(\recbuf, { | buffer |
	RecordBuf.ar(SoundIn.ar(0,1) * 0.1,buffer,loop:1.0);
}).send(s);

SynthDef(\overdub, { | buffer |
	RecordBuf.ar(In.ar(0,1),buffer,loop:1.0,recLevel:0.7,preLevel:0.7,loop:1.0);
}).send(s);


SynthDef(\playbuf, { | buf, speed = 1.0 |
	Out.ar(0,PlayBuf.ar(1,buf,speed,loop:1.0));
}).send(s);

SynthDef(\playbuf2, { | bufnum, start, loopsize = 44100.0, dur = 1.0, rate = 1.0,pos = 0.0,amp = 0.1 |
	var end = start + loopsize;
	var phase = Phasor.ar(Impulse.ar(0.1),BufRateScale.kr(bufnum)*rate,start,end);
	var sig = BufRd.ar(1,bufnum,phase,loop:1);
	var env = EnvGen.ar(Env.perc(0.0001,dur),doneAction:2);
	Out.ar(0,Pan2.ar((sig * env * amp),pos));
}).send(s);

SynthDef(\saw, { | freq = 220.0, dur = 1.0, amp = 1.0, pos = 0.0 |
	var sig = Saw.ar(freq) + SinOsc.ar(freq/2.0) + SinOsc.ar(freq*2) + SinOsc.ar(freq*4);
	var env = EnvGen.ar(Env.perc(dur/2.0,dur/2.0),doneAction:2);
	Out.ar(0,Pan2.ar(env*sig*amp,pos));
}).send(s);

SynthDef(\sqr, { | freq = 110.0, dur = 1.0, amp = 1.0, pos = 0.0 |
		var env = EnvGen.ar(Env.perc(0.001,dur), doneAction:2);

	var sig = SinOsc.ar(40.0,(freq*env*0.4).sin*2.0).sin;
	Out.ar(0,Pan2.ar(sig*amp*env,pos));
}).send(s);

SynthDef(\simple, { | freq = 660.0, dur = 1.0, amp = 0.01, pos = 0.0 |
	var env = EnvGen.ar(Env.perc(dur,dur), doneAction:2);
	var sig = SinOsc.ar(Pulse.ar(freq/1.61414)*freq);
	Out.ar(0,Pan2.ar(sig*amp*env,pos));
}).send(s);

SynthDef(\sqr2, { | freq = 110.0, dur = 1.0, amp = 1.0, pos = 0.0 |
	var env = EnvGen.ar(Env.perc(dur,dur), doneAction:2);
	var sig = SinOsc.ar(freq,mul:freq,add:freq/2.0).sin * LPF.ar(Pulse.ar(freq:freq/3000.0,width:0.01),200);
	Out.ar(0,Pan2.ar(LeakDC.ar(sig*amp*env),pos));
}).send(s);
)

x.free;
s.scope;
s.freeAll;

b.plot;
s.boot;
s.quit;
s.boot;

l = Synth(\simple);

x = Synth(\recbuf, b.bufnum);
z = Synth(\overdub,[\bufnum,b.bufnum]);
y = Synth(\playbuf2,[\bufnum,b.bufnum,\star1t,0.0,\loopsize,44100.0,\rate,2.0,\dur,1.0,\amp,0.01]);
y.free;
x.free;
z.free;
