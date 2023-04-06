(fun a 
(line 
	(seq 0 9)
	(ch 0.1 2 4 8)))

(fun b
	(t 
		(seq 0.0001 0.1 0.2 0.3)
		(fractRandTimer (ch 0.001 0.1 0.2 0.5 2))))

(fun pan
	(t
	(seq 0 127)
	(ch 0.1 2)))

(step-pan-gen

(index
	(list 
		(index OSC.table1 (line (seq pan pan ) b))
		(rv -1 1)
		)
	(t 
		(count 2)
		(rv 0 3)))

(index
(1 2 3 4 (t (rv 1 10) b) 3 3 3 9 1) (t (seq a a) b))

(index OSC.table2 (line (seq pan pan) b))

)