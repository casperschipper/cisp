(fun freq
	(line
		(hold (ch 0.5 0.4999 0.4992 0.4995 0.501) (ch 2 1))
	(ch .1 2 4 8 16)))


(fun octmup
	(t
		(ch 0.75 1 0.4 1.2)
		(ch 1 2 3 4)))

(~ wr
	(write
	OSC.table1
	(rv -1 1)
	(count 32)))

(schedule
	(~ wr)
	(st 1))

(clone
(step-gen
	(index-lin
		OSC.table1
		(bounded-walk 0 32 (* freq octmup)))
	(st 1) :pan (rvfi -1 1)) 3)