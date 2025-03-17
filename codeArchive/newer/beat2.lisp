(# mytable (collect (hzSineseg 100) 44100))
(# perc (grow 1.0 0.999 44100))

(sync 1.0)

(step-gen
	(* 
		(rv -1 1)
		(index perc (line (seq 0 16384) (seq .0 0))))
	(st 1)
	)