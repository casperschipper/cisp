(# tab1 (alloc 12))

(schedule
	(write tab1 (bounded-mup-walk 50 10000 (ch 0.5 1.5 0.75 1.25 2)) (count (table-cap tab1)))
	(st 0.5))

(fun holdi 
	(list-walk tab1 (t (rv 1 5) (rv 1 3))))



(fun a
	(hold
	(list-walk (list holdi holdi holdi holdi holdi holdi) (rv 1 20))
	(hold (seq 2 3 5 4) (ch 3 4))))

(fun length
	(line
		(ch 1 20 30 100 3000 4000 44100)
		(ch .1 .3 .5)))

(fun loopi (arg)
	(loop arg (ch 3 5 11) (ch 6 3 11)))

(fun freq
	(linseg (loopi a) (loopi a) length 1))

(step-pan-gen
(* (cycle freq) (line (seq 0 1) (loopi (ch .3 .5 .1 .05))))
(st 1)
(line (seq 0 1) (seq .1 5 7))
)