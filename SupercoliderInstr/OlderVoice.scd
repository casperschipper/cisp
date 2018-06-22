s.reboot;
s.meter;
(
SynthDef(\voice, { | freq = 200, amp = 0.1, number = 3 |
	var duration = ((1.0 / freq) * number).clip( lo: 0.1, hi: 10);
	var env = EnvGen.ar( Env.new([pi,2*pi], [duration], 'lin'), doneAction:2 );
    var ampEnv = 1.0-env.cos;
	Out.ar( 0, PanAz.ar(numChans:16,in:SinOsc.ar(freq:freq, width:0.25, mul:ampEnv ).sin, pos:\pan.ir(0),level:amp) );
}).send;
)

(
SynthDef(\voice, { | freq = 200, amp = 0.1, number = 3 |
	var duration = (1.0 / freq) * number;
	var env = EnvGen.ar( Env.new([0,pi,2*pi], [0.5*duration,0.5*duration], 'lin'), doneAction:2 );
    var ampEnv = 1.0-env.cos;
	Out.ar( 0, PanAz.ar( numChans:8, in:SinOsc.ar( freq,0.25, ampEnv*1 ).sin, pos:\pan.ir(0),level:amp) );
}).send;
)

(
SynthDef(\voice, { | freq = 200, amp = 0.1, number = 3 |
	var duration = (1.0 / freq) * number;
	var env = EnvGen.ar( Env.new([0,pi,2*pi], [0.5*duration,0.5*duration], 'lin'), doneAction:2 );
    var ampEnv = 1.0-env.cos;
	Out.ar( 0, Pan2.ar( (SinOsc.ar( freq,0.25, ampEnv*amp*1 ).sin*3).sin * 0.1, pos:\pan.ir(0)) );
}).send;
)


s.meter;
s.scope;

s.quit;

