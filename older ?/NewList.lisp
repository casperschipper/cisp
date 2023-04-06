(fun casper
	(+ 64 (seq (seq 0 -2 -7 -12 -24) (index (0 12 24 -12 7) (bounded-walk 0 4 (hold (ch -1 1) (rv 7 13)))) (seq 7 -7 12 0 36 -7 -12) 12)))

(fun velo 
	(line (seq 30 100) (ch 7 11)))

(midi-note
	0.10
	(loop casper (seq 3 2 5 3) (seq 3 1 3))
	0.1
	velo)

(midi-note
	0.10
	(loop casper (seq 3 2 5 3) (seq (rv 2 3) 1 3))
	0.1
	velo)

(midi-note
	0.10
	(loop casper (seq 3 2 5 3) (seq (rv 2 3) 1 3))
	0.1
	velo)


