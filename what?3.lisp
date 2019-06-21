(# buffy (collect (rv -1 1) 128))

(fun writeHead
		(write
			buffy
			(+ (audioIn 0) (rv -0.1 0.1))
			
				(count 128)))

(~ a
	(t
		(ch 1 2 3 0.5 40)
		(t (ch .01 3 5) (ch .01 3 5))))


(fun stepper
	(hold
		(seq -1 1)
		(rv (~ a) (~ a))))

(~ high
	(t
		(ch 128 64)
		(fractRandTimer (grow 0.01 2 8))))

(clone
	(step-pan-gen
		(bounded-list-walk (st 0) (~ high) buffy stepper)
		(st 1)
		(t
			(list-walk buffy stepper)
			(/ 1.0 (mtof (rv 0 10)))))
	3)


(step-gen
	(* writeHead 0)
	(st 1))




