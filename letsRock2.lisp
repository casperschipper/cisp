(fun three
	(hold
		(rv 1 7)
		(ch 7 11)))

(fun lsize
	(t
		(rv 1 60)
		(rv 0 4)))

(fun transpose
	(t
		(ch 1 2 3 4 10 20)
		(ch 0.5 0.5 0.5 0.5 2)))

(fun freq
	(* 
		(t
		(list-walk (grow 100 2.3 9) (hold (seq three three) (ch three three)))
		(* (list-walk (0.001 0.002 0.0005) (hold (seq three three) (seq three three))) 1)) transpose) )

(sync 0.14)

(step-gen
(seq -1 1)
(/ 44100 (loop freq lsize (st 30))))