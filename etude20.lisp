(# tab1
	(collect
		(rv 1 128)
		128))

(fun a
	(t
		(rv 1 128)
		(fractRandTimer (ch 0.001 0.1 0.2 0.5 1.0 2.0))))

(fun b
	(t
		(/ 1 (rf 0 128))
		(fractRandTimer (ch 0.001 0.1 0.2 0.5 1.0 2.0))))

(step-gen
	(index-lin OSC.table1 (line (seq a a) b))
	(st 1))