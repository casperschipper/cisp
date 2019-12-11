(# mups (0.5 1.5 0.75 1.66666667 2.0))

(fun speeds
		(bounded-mup-walk (st 200) (st 12000) (ch mups) 200)
		)

(# speedtab
	(collect speeds 8))

(schedule
	(write
		speedtab
		speeds
		(count (table-cap speedtab)))
		(/ 1 (line (seq 1 10) (ch 1 3 7))))

(fun offset
	(line 
		(seq 0 32)
		(ch .3 .7 1.1 4)))


(step-pan-gen
	(lookup OSC.table2 
		(index OSC.table1 
		(line (seq offset 128) (/ 1 (seq speedtab)))))
	(st 1)
	(line 
		(index OSC.table1 
		(line (seq offset 128) (/ 1 (seq speedtab))))
		(ch 0.001 0.01 0.2 0.4) ) )