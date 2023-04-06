(# tab1
	(list 1. 3 5 7 11 133 33 2 100 100))

(# tab2
	(fillf 32 -1 1))

(fun top
	(line
		(seq 1 (table-cap tab1))
		(ch 3 7 11)))

(fun range
	(line
		(ch 0 0 1 1 1 1 1 1 1 1 1 2 5 8)
		(ch .1 .3 1.5)))

(fun indexer
	(bounded-walk (+ top range) top (ch -1 1)))

(fun lamount
	(t
		(ch 1 3 5 10 100)
		(ch 1 2 4)))

(fun lsize
	(t
		(ch 1 2 5)
		(ch 1 2)))

(fun writeTable
	(write tab2 (audioIn 0) (count (table-cap tab2))))

(schedule 
	writeTable
	(t
		(seq 5 0.001)
		(seq 1 0.01)))

(step-gen
	(line
		(seq tab2)
		(loop (/ (index tab1  indexer) 44100) lamount lsize)
		)
	(st 1))