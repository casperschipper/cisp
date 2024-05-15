(# tab1 (sine 44100 (fillf 64 0 1)))

(~ a 
	(line
		(rv 0 (table-cap tab1))
		(ch 1 5 7)))

(~ b
	(+ (~ a) (line
		(ch 10 100 20 25 1000 44100)
		(ch 5 7))))

(fun muppy
	(line
		(ch 0.001 0.1 1 2 5)
		(ch .1 3 .5 0.01)))

(fun wl
	(t
		(/ 1.0
			(bounded-mup-walk (st 2000.0) (st 20000) (ch 0.5 1.5 2 0.75 0.66667)))
		(* (ch 1 2 3 4 5) muppy)))

(fun indexer 
	(line
		(seq (~ a) (~ b))
		(st wl)))

(~ mix
	(t 
		(seq 0 1)
		(ch 0.1 0.5 2)))

(~ mixInv
	(- (st 1) (~ mix)))

(samp-schedule
	(write tab1
		(+
			(* (~ mix) (index-lin tab1 indexer))
		    (* (~ mixInv) (+ (seq (sine 44100 (fillf 64 0 1))) (seq tab1))))
		(count (table-cap tab1)))
	(st 1))
		

(clone
(step-pan-gen
	(index-lin tab1 indexer)
	(st 1)
	(line (index-lin tab1 indexer) (st 0.01)))
3)
	
