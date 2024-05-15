(fun a
	(line
		(seq 0 128)
		(ch 0.001 0.1 0.2)))


(step-gen
(index-lin OSC.table1 (line (seq a a) (ch 0.001)))
(st 1)
:pan (rvfi -1 1))