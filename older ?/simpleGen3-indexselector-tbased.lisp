(fun b
	(t 
		(ch 5 22 100 333 888) 
		(ch 3 6 9)))

(fun a
	(t 
		(seq 1 b) 
		(ch .1 .2 .4 .8 1.6)))

(# tab1 (
	fillf 16 -1 1))

(# tab2 (fillf 16 1 1))


(fun toppy 
	(t (rv 0 16) (ch 1 2 4 8)))

(~ casper (write tab2 (rv toppy a) (rv 0 16)))

(write-schedule (~ casper) (ch (latch 0.05 100) (st 1.0)))

(fun indexSelector
	(index
		(list 
			(rv 0 toppy)
			(series (0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15))
			(list-walk (list 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15) (hold (ch -1 1) toppy))
			)
	(t
		(ch 0 1 2) 
		(ch 1.0 2.0 3.0 4.0))))


(fun panInputGen
	(index
		(list
			(rv -1 1)
			(ch -1 1)
			(seq -1 1)
			(seq (fillf 32 -1 1))
			(line (seq -1 1) (ch 0.1 0.2 1.0 2.0))
			)
		(t (ch 0 1 2 3 4) (ch 0.1 0.4 2.0 6.0))))


(clone
(step-pan-gen
	(* (hold (seq -1 1) (index tab2 indexSelector)) 0.1)
	(st 1)
	(hold panInputGen (index tab2 indexSelector))
)
1)




