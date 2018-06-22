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
	(loop 
		(rv 0 b)
		(st 10)
		(st 100)))



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
		(bounded-mup-walk 50 2000 (ch 0.66666666666667 1.5))
		(fractRandTimer (0.001 0.01 0.03 0.1 0.2 0.5))))

(channel-synth
 freqr
(st 1)
(st 0.2)
(hold 
	(index (0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21) 
	(index (list walk1 walk2) indexer))
		holder))
