(fun lines
	(line
		(rv 100 10000)
		(fractRandTimer (ch 0.001 0.1 0.05 .3 .5 .7))))

(fun innerspeed
	(mtof 
		(line
		(rv 30 128)
		(fractRandTimer (ch 0.001 0.1 0.05 .3 .5 .7)))))




(step-pan-gen
	

	(lookup OSC.table1

	(* (cycle (t (line (seq lines lines) (/ 1 innerspeed)) (st 0.001)))
	 (line (seq 0 1) (rv 1 7))))

	(st 1)

	(lookup OSC.table1
			(* (cycle (t (line (seq lines lines) (/ 1 innerspeed)) (st 0.001)))
				(line (seq 0 1) (rv 1 7))))



	)