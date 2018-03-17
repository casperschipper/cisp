(sync 0.14)

(fun foo
	(t
	(reset (bounded-mup-walk 0.05 8 (ch 0.5 1.5 0.66667)) (st 1) (ch 5 10 20))
	(ch 4 8 5)))

(~ offset
	(line
		(ch 0 40 64 100 128 200)
		(ch .1 .4 1 2 4)))

(fun size
	(t
		(ch 256 512 64)
		(ch 4 8 16)))


(step-gen
	(index-lin OSC.table9 (bounded-walk (~ offset) (+ (~ offset) 64) foo))
	(st 2)
	:pan (rvfi -1 1))
