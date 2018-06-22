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

(channel-synth
(st 100)
(st 1)
(st 0.4)
(index (0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22) 
	(index (list walk1 walk2) indexer)))