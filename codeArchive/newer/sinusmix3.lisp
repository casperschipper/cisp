(# freqs (collect (mup-walk 224.0 (ch 1.05 (rv 0.999 1.01) 1.5)) 30))

(fun f1
(t
	(ch freqs)
	(st 4)))


(fun sinusMix
	(* 0.25 (+ (list
		(cycle f1) (cycle f1) (cycle f1) (cycle f1)))))

(# tab1 (fillf 44100 0 0))

(fun tape 
	(write tab1 sinusMix (count (table-cap tab1))))

(samp-schedule
	tape
	(st 1))



(step-gen
	(* sinusMix sinusMix)
	(st 1)
	)