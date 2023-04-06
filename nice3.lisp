(fun mupWalky
	(* 
		(t
		(reset (bounded-mup-walk 0.01 4.0 (ch 0.666667 1.5)) (st 0.1) (ch 4 8 7 3))
		(+ (ch (grow 2 2 5)) (rv 0.1 0.5)))
	(t (ch -1 1) (fractRandTimer (0.1 0.4 0.8 1.6 3.2)))))


(fun a
	(line (seq 0 10) (ch 4 16 32)))

(fun offset
	(line
		(seq 0 512)
		(index 
			(1 2 3 4 5 6 7 8 9)
			(rv a a))))


(clone
(step-gen
(index-lin OSC.table9 (+ (bounded-walk 0 64 mupWalky) offset))
(st 1)
:pan (rvfi -1 1))
1)
