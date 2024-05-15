(fun timy (arg)
	(t
		arg
		(fractRandTimer (ch 0.001 0.05 0.5))))

(fun wl
	(/ 1.0
		(+ 
			(list
				(timy (rv 1 1000))
				(timy (ch 100 50 10 1000 2000 3000 4000 5000 10000))
				(timy (rv -10 10))
				(timy (line (seq 1 1000) (fractRandTimer (ch 1 3 7 0.5 0.1))))))))


(step-gen
	(index-lin OSC.table1 
		(line 
			(seq 0 128) 
			wl
			))
	(st 1))