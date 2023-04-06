(# intervals
	(list 1.5 0.75 0.333 1.25 1.2 0.8 0.6 0.5 2))

(# amps
	(list 10. 20 30 40 50 60 70 80 90 100 120))

(fun b 
	(line
		(seq 0 (table-cap amps))
		(ch 4 5 6 7 8)))

(fun ampGen
	(index
		amps
			b))

(fun a
	(line
		(seq 0 (table-cap intervals))
		(ch 4 5 6 7 8)))

(fun interval
	(index
		intervals
		(rv a a)))

(fun zero
	(line
		(ch 0. 0 0 0 0.14 0.28)
		(ch 4 5 6 7 8 )))

(fun shift 
	(t
	(seq 0.25 0.5 0.333 0.667)
	(ch 3 7 11)))

(midi-note
(seq 
	(*
		(latch zero (ch 2 8 16 32)) (seq shift shift shift shift))
	(* (t
		(ch 0.1 0.2 0.4 2 3)
		(ch 1 4 8 7 6 5)) (seq (list shift shift shift))))
(ftom (bounded-mup-walk 50 10000 (index intervals (line (seq 0 (table-cap intervals)) (fractRandTimer (.1 .2 0.01 .1 1 2 7))))))
(line (seq 0.1 0.5) (ch 1 2 5 6 7))
(hold ampGen (ch 10 20 100))
)