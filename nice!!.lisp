(sync 0.31)



(fun foo
	(t
	(reset (bounded-mup-walk 0.05 8 (ch 0.75 0.5 1.5 0.66667 2 1.333333)) (st 1) (ch 2 5 10 23))
	(ch 0.5 0.6 0.8 1.0)))

(~ offset
	(line
		(ch 0 40 64 100 128 200)
		(t
			(ch 0.2 0.1 0.05 1 .1 .4 1 2 4)
			(ch 0.2 0.1 0.05 1 .1 .4 1 2 4))))

(fun size
	(t
		(ch 256 512 64 32 2)
		(ch .4 .6 8)))


(step-gen
	(index-lin OSC.table9 (bounded-walk (~ offset) (+ (~ offset) size) foo))
	(st 2)
	:pan (rvfi -1 1))
