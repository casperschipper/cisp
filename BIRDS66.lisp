(fun a 
	(line
		(ch 1 10 100)
		(ch 3 4 5)))

(fun stepper
	(hold
		(seq -1 1)
		(rv a a)))

(fun three
	(hold
		(list-walk (steno "1..8 2..16 3..18") stepper)
		(list-walk (steno "asgdsfbsdvfbsdvfbsvdbcbcnbbsbsbdbsndnsbdfsdsbsbsbs") stepper)))

(# table (steno "0.0 skjdfhksjdhfkajhdskjfahsdkfadsf"))

(fun holder
	(seq (steno "bbbbebbebebbebefgehfbefbfhebfegfbehfgefhegbfhegef")))

(fun lsize
	(t
		(list-walk (steno "jdhflajbfjhbhjfbvdfvabcuabuyeabprvbvuhbdjfvhbjkdabvh") (hold (seq -1 1) holder))
		(rv 0 4)))

(fun transpose
	(t
		(ch 1 2 3 4 10 20)
		(ch 0.5 0.5 0.5 0.5 2)))

(fun freq
	(* 
		(hold
		(list-walk (steno "1000..2000 19000..19100") (hold (seq -1 1) (ch three three)))
		(* (list-walk (fillf 20 1 10) (hold (seq three three) (seq three three))) 1)) transpose) )

(sync 0.14)

(step-pan-gen
(seq (sine 64 (fillf 28 -1 1)) :max (st 100))
(/ 44100 (loop freq lsize (ch (steno "bbdfgfgfgfgffffgggfgfabbbbbbbbbcbcbcbbcbcdddcdcdcdcdcbdbbcdbcdbcbd"))))