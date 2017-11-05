(# timy
	(1. 4 2 44 1 7 6 3 3 3 3 3 4 9 10 11 512))

(fun a
	(line
		(seq 0 (table-cap timy))
		(ch 5. 7 2 0.01)))

(fun sr
	(line
		(seq 0.001 0.01)
		(ch 0.01 0.2 1 4 8 16)))

(step-gen
	(seq (fillf 8 -1 1))
	(index timy (line (seq a a) sr) ))
