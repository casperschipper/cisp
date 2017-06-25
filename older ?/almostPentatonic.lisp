(fun four
	(hold
		(* 
			(series 400.00 200 333.3333 300 250 125 500) 
			(seq 0.125 0.25 0.5 1.0) true)
		(rv 1 3)))

(clone
(step-gen
	(seq -.1 .1)
	(t (seq four four four) (chfi (list 0.07 1.4 0.28 0.42 ) ))
	:pan (rvfi -1 1))
8)