(# buffy (collect (st 0) 128))

(fun writeHead
	(t
		(write
			buffy
			(rv -1 1)
			
				(count 128))
		(st 0.1)))

(fun a
	(line
		(seq 1 1000)
		(ch 1 3 5 )))


(fun stepper
	(hold
		(seq -1 1)
		(rv a a)))

(clone
	(step-pan-gen
		(list-walk buffy stepper)
		(st 1)
		(t
			(list-walk buffy stepper)
			(/ 1.0 (mtof (rv 0 80)))))
	1)


(step-gen
	(* writeHead 0)
	(st 1))


