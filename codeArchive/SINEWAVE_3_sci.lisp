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


(# mytab
	(collect (bounded-mup-walk 110 4000 (ch 0.66666667 1.5)) 32))

(samp-schedule
	(write mytab (bounded-mup-walk 110 4000 (ch 0.666666667 1.5)) (count (table-cap mytab)))
	(st 4000))

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

(sync 0.25)

(sci2
	saw
	(st 0.25)
	:freq (list-walk mytab)
	:amp (st 0.1)
	:dur (st 5)
	:pos (rv -1 1))