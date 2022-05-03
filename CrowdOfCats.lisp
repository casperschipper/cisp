(fun scaleWalker
	(hold
		(seq -1 1)
		(hold
			(seq 11 13 7 1)
			(seq 2 3 1 4 7 6 3))))



(fun lowera
	(line
		(seq 0.0001 0.02 0.2)
		(seq 5 7 3)))

(fun a
	(line
		(seq lowera 0.2)
		(ch 3 5 7)))

(fun aa
	(line
		(seq lowera 0.2)
		(ch 3 5 7)))

(fun b 
	(t
		(ch 1 10 20 30)
		(ch 5 7 9)))

(fun top
	(line
		(seq 0 128)
		(ch 3 5 7)))

(fun bottom
	(line
		(seq 0 128)
		(ch 3 5 7)))

(fun pause
	(t
		(seq 0 1)
		(ch 3 7 11)))

(clone
(midi-note-channel
	(seq 
		(latch (rv a aa) (ch 30 7 10 3)) 
		(latch (* (ch 0.1 0.5 2.5 5) pause) (st 1)))
	(latch-walk (reset (walk 60 (seq 0 0 0 0)) (st 6 0) (ch 7 10 30)) (latch (list-walk (list -12 -1 1 0 0 2 -1 ) scaleWalker) (st 4)))

	(* (rv a aa) 4)
	(loop (rv top bottom) (st 3) (st 3))
	(hold (seq 1 2 3) b)) 3)