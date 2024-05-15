(# localTab (alloc 128))

(fun switch
	(t
		(ch 3 5 6 2)
		(t (ch 11 33) (ch 3 5 7))))

(fun top
	(t
		(ch 0.00001 0.001 0.1 0.5)
		(ch .1 .3 .7)))

(fun a
	(line
		(seq 1 -1)
		(ch 1 3 6)))

(fun writeHolder
	(t
		(ch 1)
		(ch 1 3 5))


(samp-schedule
	(write localTab (clip (+ (index localTab (count 128)) (hold (ch (* -1 top) top) writeHolder)) -1 1) (count 128))
	(line (rv 1 100) (ch 0. 1 2)))


(fun steppy
	(t
		(reset (bounded-mup-walk 0.25 10.0 (seq 0.6666667 0.999 (ch 1 2) (ch 0.66666666666667 1.5) 1.5)) (st 1.0) (rv 8 23))
		(t (rv 1 5) (ch 3 5 7))))

(step-gen
	(clip (index-lin localTab (bounded-walk 0 128 steppy)) a 1)
	switch
	:pan (rvfi -1 1))

(step-gen
	(clip (index-lin localTab (bounded-walk 0 128 steppy)) a 1)
	switch
	:pan (rvfi -1 1))

(step-gen
	(clip (index-lin localTab (bounded-walk 0 128 steppy)) a 1)
	switch
	:pan (rvfi -1 1))


