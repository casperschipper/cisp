(# tab1 (list 1.0 2 7 9 11 22 32 52 10))

(# tab2 (list 1.0 2 3 5 7 9 11 2.5 4 55))

(fun a 
	(line (seq 0 9) (ch (grow 0.1 2 7))))

(fun b 
	(line (seq 0 9) (ch (grow 0.1 2 7))))

(fun loopAmount
	(seq
		(tLatch (st 1) (rv 1 8))
		(tLatch (ch (grow 1 2 7)) (ch 0.1 0.2 1.0 4.0))))

(fun loopSize
	(seq
		(tLatch (st 1) (rv 1 8))
		(tLatch (ch (grow 1 2 7)) (ch 0.1 0.2 1.0 4.0A))))

(step-gen
	(loop (seq (fillf 8 -1 1)) loopAmount loopSize)
	(loop 
	(* (index tab1 (rv a b))
		(seq 
			(index tab2 (rv a b))
			(index tab2 (rv a b)))) loopAmount loopSize))