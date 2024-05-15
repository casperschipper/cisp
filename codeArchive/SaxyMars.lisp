(fun indexer 
	(t
		(rv 0 5)
		(ch 1 2 10 20)))

(step-gen 
;shift (line (seq 0 400) (ch 1. .1 0.01 0 2 4 20))
(index-lin OSC.table9 
	(bounded-walk (+ 0 (~ shift)) (+ 100 (~ shift)) (rv 0.125 0.126) ))
(st 1) :pan (rvfi -1 1))

(step-gen 
;shift2 (line (seq 0 400) (ch 1. .1 0.01 0 2 4 20))
(index-lin OSC.table9 
	(bounded-walk (+ 0 (~ shift2)) (+ 80 (~ shift2)) (rv 0.125 0.126) ))
(st 1) :pan (rvfi -1 1))


(step-gen 
;shift3 (line (seq 0 400) (ch 1. .1 0.01 0 2 4 20))
(index-lin OSC.table9 
	(bounded-walk (+ 0 (~ shift3)) (+ 80 (~ shift3)) (rv 0.125 0.126) ))
(st 1) :pan (rvfi -1 1))


(step-gen 
;shift4 (line (seq 0 400) (ch 1. .1 0.01 0 2 4 20))
(index-lin OSC.table9 
	(bounded-walk (+ 0 (~ shift4)) (+ 80 (~ shift4)) (rv 0.125 0.126) ))
(st 1) :pan (rvfi -1 1))

