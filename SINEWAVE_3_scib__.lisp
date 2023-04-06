/* 
(
SynthDef(\saw, { | freq = 220, amp = 0.1, dur = 0.5 | 
	var sig = Saw.ar( freq, amp);
	var cutoff = EnvGen.ar( Env.new([100,10000,100], [0.05,dur], [5,5]));
	var moog = MoogVCF.ar(sig,cutoff,0.1);
	var env = EnvGen.ar( Env.new([0,1,0], [0.05,dur], [5,-3]),doneAction:2);
	Out.ar(0,moog * env ! 2);
}).send;
)
*/

/*
(
SynthDef(\sin, { | freq = 220, amp = 0.1, dur = 0.5, pos = 0.0 | 
	var sig = Blip.ar( freq:freq,mul: amp , numharm:500);
	var env = EnvGen.ar( Env.new([0,1,0], [0.5*dur,0.5*dur], [-5,-2]),doneAction:2);
	Out.ar(0,Pan2.ar(sig * env,pos));
}).send;
)
*/



(# mytab
	(collect (bounded-mup-walk 110 1000 (ch 0.5 2.0)) 44100))

(fun la
	(line (ch 0.0 0.0 0.0 0.001 2 10 1 1000) (ch 1 3 7 11)))

(samp-schedule
	(write mytab (bounded-walk 50 15000 (ch (* -1 la) la)) (count (table-cap mytab)))
	(st 4))

(fun clocker
	(fractRandTimer
		(ch 0.001 0.02 0.03 2.0)))

/*
(clone 
(step-gen
	(cycle (t (list-walk mytab (hold (seq -1 1) (ch 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 3 4))) (hold (seq clocker clocker) (ch 3 6 9) )))
	(st 1.0)
	:pan (rvfi 0 1))
20)*/


(sci2
	sin
	(st 0.01)
	:freq (ch mytab)

	:amp (st 0.001)
	:dur (ch 3.0)
	:pos (bounded-walk -1 1 (ch -0.1 0.1)))


