(# tab1 (fillf 10 0 0))

(fun holder
	(hold
		(ch -1 1)
		(ch 1 2 4 8 16 32 64)))

(clone
(step-gen
(* 0.01 (write tab1 
	(bounded-walk 0 2048
		(bounded-walk -512 512
			(index OSC.table9 (+ 
				(rv 0.0 1.0) 
				(list-walk tab1 holder)))))
	(count (length tab1))))
(st 1)
:pan (rvfi -1. 1.))
5)



