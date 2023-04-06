(fun top
	(line
		(ch 0.0001 0.01 0.2 0.0003)
		(ch 1 3 6)))

(~ myIndex
	(line
		(seq 0 128)
		(st 0.1)))

(~ writem
	(write OSC.table1 (clip (+ (index OSC.table1 (~ myIndex)) (rv (* -1 top) top)) -1 1) (~ myIndex)))

(samp-schedule
	(~ writem)
	(line (ch 1 100 1000) (ch 1 3 4)))

(~ writem2
	(write OSC.table2 (clip (+ (index OSC.table2 (~ myIndex)) (rv (* -1 top) top)) -1 1) (~ myIndex)))

(samp-schedule
	(~ writem2)
	(line (ch 1 100 1000) (ch 1 3 5)))

(~ writem3
	(write OSC.table3 (+ (index OSC.table3 (~ myIndex)) (rv (* -1 top) top)) (~ myIndex)))

(samp-schedule
	(~ writem3)
	(line (ch 1 100 1000) (ch 1 3 5)))

(step-gen
(index-lin OSC.table1 (line (seq 0 128) (st 0.003)))
(st 1)
:pan -0.5)

(step-gen
(index-lin OSC.table2 (line (seq 0 128) (st 0.001)))
(st 1)
:pan 0.5)

(step-gen
(index-lin OSC.table1 (line (seq 0 128) (st 0.008)))
(st 1)
:pan 0.5)


(step-gen
(index-lin OSC.table3 (line (seq 0 128) (st 0.002)))
(st 1)
:pan 0.)