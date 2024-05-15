(# tab1 (fillf 16 1 50))

(fun a 
(line (seq 0 (table-cap tab1))
	(ch 0.1 0.5 1.0 2.4 5.0)))

(step-gen
	(index OSC.table1 (rv a a))
	(index tab1 (rv a a))
	:pan (rvfi -1 1))	