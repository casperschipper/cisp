

(sync 0.16)

(sci2
	pulse
	(* (seq 0 0 0.16 0.14) (line (seq 1.0 10.0) (ch 4 8)))
	:freq 
	(loop
		(index
			(
				(reset 
					(walk 0 (ch 100 150)) (st 100) (ch 1 2 4 5 7 8))
				(reset
					(mup-walk 0 (ch 0.75 1.5 0.6666667)) (st 300) (ch 3 4 5)))
			(t
				(count 2)
				(ch 2 3 4 5 6)))
		(ch 2 4 6)
		(ch 5 3 3 2))
	:duration (* (mtof (slider 9 :d 20)) 0.01)
	:filter 
	(seq
		(line
		(seq 20 15000) 
		(ch 1 2 3 4))
		(line
		(seq 20 15000) 
		(ch 1 2 3 4))
(line
		(seq 20 15000) 
		(ch 1 2 3 4)))
	:attack 
	(line
		(seq 0.01 0.01 0.5 0.5)
		(ch 2 4 7))
	)