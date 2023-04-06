(# buffy (collect (st 0) 128))

(fun writeHead
		(write
			buffy
			(+ (audioIn 0) (hold (seq -1 0 1) (ch 3 5 10 200 (rv 1 1000) (rv 1 160000))))
			
				(count 128)))

(fun sometimes
	(index
		((rv 1 10)
		(mtof (rv 10 10000)))
		(t
			(ch 0 1)
			(ch 3 7 11))))

(fun a
	(line
		(ch 1 2 3 5 sometimes)
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
			(/ 1.0 (mtof (rv -20 -40)))))
	2)


(step-gen
	(* writeHead 0)
	(st 1))


