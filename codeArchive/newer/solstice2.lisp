(# mytable (collect (sineseg 16384) 16384))
(# perc (grow 1.0 0.999 44100))

(sync 1.0)

(step-gen
	(* 
		(index mytable (line (seq 0 16384) (seq 0.0025 0)))
		(index perc (line (seq 0 44100) (seq 1.1 1.1))))
	(st 1)
	)