/* 
step-gen is a generator
that takes two arguments
amplitude
time


*/

(fun
	step
		(* 
			(line (seq 0.99 1.01) (ch 0.1 0.4 1 5 10))  
			(t  
				(bounded-mup-walk (st 0.25) (st 128.0) (index (0.5 2.0 1.5 0.75 16) (count 33)))
				(ch .5 .4 11 8))))


(# tab1 (sine 256 (fillf 16 0 1)))

(clone
	(step-gen
		(* 
		(index-lin tab1 (bounded-walk (st 0) (table-cap tab1) step)) 
		0.1)
		(st 1)
		:pan (rvfi -1 1)) 
6)