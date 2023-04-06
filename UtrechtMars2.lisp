(# noise (fillf 32 -1 1))
(# noise2 (fillf 32 -1 1))
(# timers (0.01 0.02 0.001 0.1 0.11 0.2 0.3 0.4 0.8 1.5 1.9 2.3))
(# timers2 (0.001 0.01 0 3 7))
(# timers3 (0.001 0.1 0.2 0.3 0.03 0.0002))


(fun aa
	(line
		(seq 0 (table-cap timers))
		(ch timers2)))

(fun a 
	(line
		(seq 0 9)
		(index timers (rv aa aa))))




(fun stepi
	(index-lin timers (rv a a)))

(step-pan-gen
	(index-lin
		noise (bounded-walk 0 32 stepi))
	(st 2)
	(index-lin
		noise (bounded-walk 0 32 stepi)))

