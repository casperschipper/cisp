(fun holder
	(line (seq 1 100) (ch 0.1 0.3)))

(fun mupper
	(reset (mup-walk 0 
		(hold (ch 0.9) holder)
			) (st 1) (st 300)))

(step-gen
	(* (rv -1 1) mupper)
	(st 1))