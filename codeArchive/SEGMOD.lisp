// so hello km28
// this will be live coding
// hopefully...

(fun timer
		(fractRandTimer (ch 0.001 0.002 0.003 (line (seq 0.1 3.0) (st 30)))))

(# mem1
	(alloc 10))

(fun slowlydetune
	(line
		(seq 1.0 0.97)
		(st 30)))

(fun timer2
	(line
		(seq 1 0.01)
		(st 30)))

(schedule
(write mem1
	(* (ch 0.5 2.0 1.6666666 (rv 0.3 0.9)) slowlydetune)
	(count (table-cap mem1))
	) timer2)

(fun bottom
	(line
		(seq 100 10)
		(st 30)))

(fun freq
	(t 
		(bounded-mup-walk bottom (st 20000) (ch mem1) 1000)
		timer))

(step-pan-gen
	(lookup OSC.table1 (cycle freq)) // this is a sinewave.. 
	(st 1)
	(line (seq -1 1) (fractRandTimer (ch 0.001 0.1 0.2 0.5 1.0 1.5)))) 