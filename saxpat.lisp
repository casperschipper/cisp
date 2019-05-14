(sync 0.14)

(fun velo
	(line
		(seq 100 40)
		(ch 3 7 11)))

(fun zero
	(hold
		(seq (seq 0 0 0 0 -10 -12 ) (seq 7 2) (seq 4 -7 -4))
		(seq 5 3)))

(fun high
	(hold
		(index (12 14 17 24 19 10) (+ (count 6) (rvi 0 5)))
		(index (list 2 5 3) (+ (count 2) (rvi 0 1)))))

(midi-note
	(* 0.14 (seq 1.05 0.95))
	(hold 
		(+ 50 (seq zero (hold (seq 7 9) (seq 3 2)) 4 (hold (seq high high high high high) (seq 2 3)) 0 7 4))
		(hold
			(seq 1 1) 
			(seq 4 2)))
	(st 0.2)
	(seq velo velo velo))
