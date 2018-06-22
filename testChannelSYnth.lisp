(fun a 
	(line
		(seq 0 128)
		(ch 1 2 4 .1 8 16)))

(channel-synth
(reset (walk 0 (st 50)) (ch 100) (st 20))
(line (seq 1 100) (ch .1 .3 1 7))
(seq (latch (st 0) (seq 100 20 500 500 1000)) (st 1))
(* (+
	(index OSC.table1 (line (seq a a) (st 0.01))) 1) 8))