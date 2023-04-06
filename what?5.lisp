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
		(ch 1024 2048 4048)
		(fractRandTimer (grow 0.001 2 8))))

(clone
	(step-pan-gen
		(write
			buffy
			(bounded-list-walk (st 0) (~ high) buffy stepper)
			(seq (count2 44100) (latch (st 1) (rv 0 1000000))))
		(st 1)
		(t
			(list-walk buffy stepper)
			(/ 1.0 (mtof (rv 0 80)))))
	4)


(step-gen
	(* writeHead 0)
	(st 1))


