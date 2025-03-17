(fun a 
	(line 
		(seq 0 128)
		(rv 8 10)))

(fun ampi
	(line
		(seq a a)
		(fractRandTimer (ch (rv 0.01 0.002) 1.0 3.0 4.0))))

(fun phaser
	(line
		(seq 0 128)
		(t 
			(reset (mup-walk 0.001 (ch 0.5 2.0 0.6667 (rv 0.99 1.01) 1.01)) (st 0.00125) (st 20))
			(ch 1 2 4 8 16)))
	)


(step-gen
	(index-lin
		OSC.table2 
		(- (* (index-lin OSC.table1 phaser) ampi)
		 (st 64)))
	(st 1)
	:pan (rvfi -1 1))

