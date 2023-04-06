(fun a 
	(line
		(seq 0 128)
		(ch 1 2 4 .1 8 16)))

(fun b
	(line
		(seq 0 20)
		(ch 1 2 6)))

(fun walk1
	(bounded-walk (st 0) b (ch -1 1)))

(fun walk2
	(rv 0 b))



(fun indexer
	(line
	(seq 1 2)
	(ch 1 2 4)))

(fun holder
	(t
		(ch 1 4 1000 10000)
		(ch .1 .2 .99 2 7)))

(fun freqr
	(t
		(st 100)
		(ch .1 .2 .99 2 7)))

(channel-synth
 freqr
(st 1)
(line (seq 0.0 0.1) (ch 1 4))
(hold 
	(index (0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22) 
	(index (list walk1 walk2) indexer))
		holder))
