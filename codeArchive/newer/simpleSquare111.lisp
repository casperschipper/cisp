(fun low
	(t
		(seq OSC.table1)
		(st 0.01)))

(fun 
	len1
	(line
		(seq 0.01 0.02 0.001 0.0002)
		(ch 0.1 0.5 0.5 0.6)))
	

(step-gen
	(index OSC.table1 (line (seq low 128) len1))
	(* (seq OSC.table1) 1))