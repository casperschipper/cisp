(sync 0.14)

(fun foo
	(t
	(hold (reset (bounded-walk 0.01 8 (ch 0.1 0.2 0.3 0.5)) (st 1) (ch 2 3 5)) 2)
	(ch 5 9)))

(~ offset
	(line
		(ch 0 40 64 100 128 200)
		(t
			(ch (rv 0.001 0.1) 0.05 1 .1 .4 1 2 4)
			(ch 0.2 0.1 0.05 .1 .4 1 2 4))))

(fun size
	(t
		(ch 256 512 64)
		(ch 4 8 16)))


(step-pan-gen
	(index-lin OSC.table9 (bounded-walk (~ offset) (+ (~ offset) 64) foo))
	(st 2)
	(index-lin OSC.table9 (line (seq 0 512) (ch 10 2 1 0.1))))
