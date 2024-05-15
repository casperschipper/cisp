(# buf1 (alloc 200000))

(~ low
	(line
		(seq 0 (table-cap buf1))
		(ch 10 30)))

(fun a 
	(line 
		(seq 0 (table-cap buf1))
		(ch 10 (rv 20.9 70.01))))

(samp-schedule
	(write buf1 (audioIn 0) (count (table-cap buf1)))
	(st 1))

(~ b
	(t 
	(ch 0.01 1 9)
	(ch 0.1 2 1)))

(~ c
	(t 
		(ch 0.02 0.5 5)
	(ch 3 5)))

(~ loops
	(line 
	(hold (ch 1 20) (st 2))
	(ch 1 3 5)))

(fun updaty
	(t
		(ch 0.1 0.001 0.02 0.003)
		(ch 1 3 4 5 10)))

(fun loopLength
	(t
		(t (line (seq 0.001 1.0) updaty) updaty)
		(rv 3 7)))

(~ loopyLenght
	(seq 2)
	(st 3))
		

(~ speed
	(t
		(ch 0.1 4 (rv 1 30))
		(fractRandTimer (ch 0.01 0.002 3 7))))

(clone
	(step-gen
		(index-lin buf1 (bounded-walk (st 0) (table-cap buf1) (t (seq (* -1 (~ speed)) (~ speed)) (fractRandTimer (ch 0.001 0.02 0.0003 0.0001 0.1 1 2 4 0.003)))))
		(st 1)
		:pan (rvfi -1 1))
	7)
