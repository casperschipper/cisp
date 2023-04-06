// Really good stuff

(# buffy (collect (st 0) 1024))

(fun writeHead
	(t
		(write
			buffy
			(rv -1 1)
			
				(count 1024))
		(st 0.01)))

(~ a
	(t
		(ch 1 3 5 50 100 200 500)
		(ch 1 3 5)))


(fun stepper
	(hold
		(ch -1 1)
		(rv (~ a) (~ a))))

(~ high
	(t
		(ch (steno "jsdhkdjhergviuarvuvbybqoefnvbhhvibauhvbaehouvbhjfbjrabvjhbfsdvbhfvbhsdfbjhvbfbhjvshfdbvhshjebjhvbhbv bhjserb vhnsber vv"))
		(fractRandTimer (grow 0.01 2 8))))

(fun ffreq
	(line 
		(seq 50 20000)
		(fractRandTimer (ch .1 .4 .5 .6))))

(fun filter (input)
	(biquad input 0 ffreq 0.8 1.0))

(clone
	(step-pan-gen
		(filter (loop (write
			buffy
			(filter (bounded-list-walk (st 0) (~ high) buffy stepper))
			(seq (count2 44100) (latch (st 1) (rv 0 100))))
		(ch (grow 2 2 8)) (ch (grow 2 2 8))))
		(st 1)
		(t
			(list-walk buffy stepper)
			(/ 1.0 (mtof (rv -20 80)))))
	4)


(step-gen
	(filter (* writeHead 0))
	(st 1))


