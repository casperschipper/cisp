(# tones (1. 2 4 1 1.5 1 2 1.25 1 1.666667))

(fun stepIndex
	(line
		(seq 0 (table-cap tones))
		(ch 60 33 1)))

(fun noisy
	(line
		(seq 0 (rv 0 0.8))
		(fractRandTimer (ch 0.0001 0.002 0.001 0.1 0.2 14))))


(fun cycle
	(*
		(line
			(seq 100 100.01 99.99) 
			(hold 
				(seq 100 1001) 
				(weights ((1 100) (2 1)))))
	(index tones (+ stepIndex noisy))))


(clone 
(line-gen
	(index-lin (list -.1 .1) (bounded-walk 0 1 (/ 1 cycle))) 
(st 1)
:pan (rvfi -1 1))
2)