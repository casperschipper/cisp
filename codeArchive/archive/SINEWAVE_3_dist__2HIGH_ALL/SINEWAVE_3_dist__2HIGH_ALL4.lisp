/*

(
SynthDef(\sin, { | freq = 220, amp = 0.1, dur = 0.5, pos = 0.0 | 
	var frq = Saw.ar( midicps(Rand(100,128.0)), freq/2,freq/2);
	var sig = SinOsc.ar( freq:frq,mul: amp);
	var env = EnvGen.ar( Env.new([0,1,0], [0.5*dur,0.5*dur], [-2,-2]),doneAction:2);
	Out.ar(0,Pan2.ar(sig * env,pos));
}).send;
)




*/


// making the


(# mytab
	(collect (bounded-mup-walk 110 1000 (ch 0.5 2.0)) 8))

(fun la
	(t (rv 1 100) (ch 1 3 7 11)))

(samp-schedule
	(write mytab (bounded-walk 200 1200 (ch (* -1 la) la)) (count (table-cap mytab)))
	(st 40))

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
	(fractRandTimer (line (ch 0.2 0.3) (ch 1 2 3)))
	:freq (ch mytab)

	:amp (st 0.05)
	:dur (ch 3.0 6.0 0.2 0.1)
	:pos (bounded-walk -1 1 (ch -0.1 0.1)))


