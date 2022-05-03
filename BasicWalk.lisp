(fun maxLength
	(line
		(seq 1 50)
		(ch 7 11)))

(fun halfMaybe
	(line
		(seq 0.5 0.5 0.49 0.55 0.45 0.1 0.9)
		(rv 3 6)))

(fun f 
	
	(reset 
		(mup-walk 400 (ch halfMaybe 2.0))
		(st 400) maxLength)
		)

(fun timer
	(line
		(seq 0.01 0.04)
		(ch 5 6)
			))

(clone
(step-gen
	(cycle 
		(t 
			f timer))
	(st 1)
	:pan (rvfi -1 1))
10)