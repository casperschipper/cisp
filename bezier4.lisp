(fun point1
	(line
		(rv -.1 .1)
		(ch 1 2 4)
	))

(fun point2
	(line
		(rv -.1 .1)
		(ch 1 2 4)
	))


(step-pan-gen
	(index-lin 
		(list
		(index-lin (list point1 point2) 
		(bounded-walk 0 1 (st 0.01))) 
		(index-lin (list point1 point2)  
		(bounded-walk 0 1 (st 0.01))))
	(bounded-walk 0 1 (st 0.01)))
	(st 1)
	(st 0)
)