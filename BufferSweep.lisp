(# noise (fillf 16384 -1 1))


(fun offset
	(t
		(loop (seq 100 200 300 400 500 600) (st 2) (ch 2 2 2 2 3))
		(st 0.14)))


(fun a
	(line
		(seq 1 100)
		(seq 1 3 7)))

(fun modNoise
	(seq
		(latch (st 0) a)
		(latch (rv 1 100) (st 1))))

(step-gen
	(index-lin noise (+ (+ offset (count 128)) modNoise) )
	(st 1)
	:pan .0)

(step-gen
	(index-lin noise (+ (+ offset (count 128)) modNoise) )
	(st 1)
	:pan 1)