(# tab1 (fillf 44100 -1 1))

(~ a 
	(line
		(rv 0 44100)
		(ch 1 5 7)))

(~ b
	(+ (~ a) (line
		(ch 100 10 50 10)
		(ch 5 7))))

(fun muppy
	(t
		(ch 0.001 0.1 1 2)
		(ch .1 3 .5 0.01)))

(fun wl
	(line
		(/ 1.0
			(rf -10 137))
		(* (ch 1 2 3 4 5) muppy)))

(fun indexer 
	(line
		(seq (~ a) (~ b))
		(st wl)))

(step-pan-gen
	(index-lin tab1 indexer)
	(st 1)
	(index-lin tab1 indexer))
