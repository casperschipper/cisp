(fun three
	(hold
		(rv 1 7)
		(ch 7 11)))

(fun freq
	(t
		(list-walk (grow 800 2.3 13) (hold (seq three three) (ch three three)))
		(* (list-walk (0.01 0.001 0.02 0.003 0.0001) (hold (seq three three) (seq three three))) 1)))

(sync 0.14)

(step-gen
(seq -1 1)
(/ 44100 (loop freq (st 3) (st 3))))