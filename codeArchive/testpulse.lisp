(# duras 
	(fillf 4 1 10.0))

(# amps
	(fillf 32 -1 1))

(# delays
	(22. 220 100 200 233.33333 2000 15000 800))

(procedure r1
	(# duras (1.0 2.0 3.0 4.0 400.0)))

(procedure r2
	(# duras (1.0 2.0 3.0 4.0 8.0)))

(procedure r22
	(# duras (collect (rf 1 40) 5)))
	
(procedure r3
	(# duras (collect (rv 1 120) 32)))

(procedure r4
	(# amps (collect (rv -1 1) 32)))

(procedure r5
	(# amps (collect (* (exprv 0 1 5) (ch -1 1)) 32)))

(procedure r6
	(# amps (collect (ch -.1 .1) 32)))

(procedure r7
	(# amps (sine 32 (list 1.0))))

(procedure r8
	(# delays (fillf 8 1 1000)))

(procedure r9
	(# delays (collect (rf 100 130) 8)))

(procedure r10
	(# delays (collect (rf 40 52) 8)))

(procedure r11
	(# amps (-1. -1 1 1)))

(procedure r12
	(# duras
		(collect (seq (rv 100 300) (rv 100 3) (rv 1 2) (rv 1 20)) 4)))

(procedure r13
	(# amps (collect
		(seq (rv -1 1) 0 0 0) 4)))


(fun indexer
	(index
		(
			(rv 0 4)
			(hold (rv 0 4) (rv 1 200))
			(seq 0 1 2 3)
			(bounded-walk 0 3 (ch -1 1))
			(hold (rv 0 4) (rv 1 10))
			(hold (count 4) (ch 4 8 16 32))
			(rv (line (seq 0 5) (ch 3 5 7)) (line (seq 0 5) (ch 3 5 7)))
			)
		(t
			(ch 0 1 2 3 4 5 6 6 6 6 6)
			(t (ch .05 .1 .2 .3 4 8 10) (ch .1 .2 4 5 7 8)))))

(clone
(pulse-fb-gen
	(index amps indexer)
	(index duras indexer)
	(index amps indexer) 
	(t (seq delays) (ch .1 .2 2 8))
	(hold (ch 0. 0 0 0 0 0 0.0 -0.77 -0.5 -0.25 0.9 -0.99) (ch (grow 1 2 14)))
	(index
		(list 
			(index (list r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r22 r11 r12 r13) (rv 0 15))
			(st 1.0)
			) (weights ((0 1) (1 1000))))
	) 1)