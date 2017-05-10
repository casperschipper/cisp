(# amps (fillf 16 -1 1))

(~ center (hold (bounded-walk 1 300 (rv -40 40)) 2))
(~ deviation (ch 1 10 20 30 40 100) )

(~ width (st 10))

(procedure casper2
	(~ width 
		(exprv 
			(take (~ center) ) 
			(+ 
				(take (~ center) ) 
				(take (~ deviation) )
				) 
				(rvi 1 1000))))

(schedule casper2 ( t (ch (grow 0.01 2 10)) (rv 0 4)))

(clone
(step-pan-gen 
	(seq -.3 .3)
	(~ width)
	(seq (collect (exprv -1 1 1) 32)))
3)
