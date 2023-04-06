(fun point1
	(line
		(seq -1 1)
		(ch 0.0001 .05 0.001)
	))

(fun point2
	(line
		(seq -1 1)
		(ch 0.0001 0.05 0.001)))

(~ freq
	(* 0.01
	(index-lin 
		(
		(index-lin (list point1 point2) 
		(bounded-walk 0 1 (st 0.001))) 
		(index-lin (-1 1) 
		(bounded-walk 0 1 (st 0.001)))
	) 
	(bounded-walk 0 1 (st 0.001)))))

(step-gen
	(index-lin 
		(
		(index-lin (list point1 point2) 
		(bounded-walk 0 1 (~ freq))) 
		(index-lin (-1 1) 
		(bounded-walk 0 1 (~ freq)))
	) 
	(bounded-walk 0 1 (~ freq)))

	(st 1)
)