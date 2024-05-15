(# t1 (100. 200 300 400 500 600 1000 1200 2400 4800 9600 12000))
(# t2 (1. 2 0.5 3 1.1 3.4))


(fun a
	(line
		(seq -1 1)
		(ch .1 .6 .99)))

(~ b
	(/ 1
		(line
			(ch .2 10)
			(ch 3 7 11))))


(~ pwrite
	(write t1
		(bounded-mup-walk (st 50) (st 12000) (ch 1.9 0.8))
		(count (table-cap t1))))

(schedule (~ pwrite)
	(st 1))


(fun freq
	(mup-mod-index (line (seq a a) (~ b))
		t1 t2))

(fun slow
	(t
		freq
			(t
				(seq 0.1 0.001 0.2 0.4)
				(ch 1 3 5))))


(sci2
	casper
	(st 0.01)
	:freq (mup-mod-index
			(write OSC.table1 (lookup OSC.table1 (line (seq -1 1 ) (/ 1.0 freq))) (hold (count (table-cap OSC.table1)) (sometimes 100 1000 1))) t1 t2)
	:duration (line (seq 0.1 4) (ch 3 8))
	:amp (st 0.01)
	:posi (seq a a))

/************************************
(
SynthDef(\casper,
{ | freq, amp, duration,posi |
	var sig = Pulse.ar( freq: freq, width: 0.5 );
	var env = EnvGen.kr ( Env.perc(0.001,duration), doneAction:2);
		Out.ar( 0, Pan4.ar( sig*env * amp, posi ));
}).add;
)
s.quit;
s.boot;
Server.killAll;

s.scope;
**********************************/

/* first start */