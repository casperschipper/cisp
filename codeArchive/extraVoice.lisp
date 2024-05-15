(# buff (alloc 4410))


(samp-schedule 
(write buff (audioIn 4) (count2 (table-cap buff)))
(t
	(seq 1 (* 44100 1))
	(st 5)))

(step-gen
(index buff (+ (latch (count2 256) 20) (rv 0 4410) ))
(st 1)
:pan (rvfi -1 1))