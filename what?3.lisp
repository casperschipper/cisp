(# buffy (collect (st 0) 128))

(fun writeHead
	(t
		(write
			buffy
			(rv -1 1)
			
				(count 128))
		(st 0.1)))

(~ a
	(line
		(ch 1 3 5 100 200 1000)
		(ch 1 3 5)))


(fun stepper
	(hold
		(seq -1 1)
		(rv (~ a) (~ a))))

(~ high
	(t
		(ch 32 4 64 128 256)
		(fractRandTimer (grow 0.001 2 8))))

(clone
	(step-pan-gen
		(bounded-list-walk (st 0) (~ high) buffy stepper)
		(st 1)
		(t
			(list-walk buffy stepper)
			(/ 1.0 (mtof (rv 0 80)))))
	3)


(step-gen
	(* writeHead 0)
	(st 1))


