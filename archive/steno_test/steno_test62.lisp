(# table 
	(collect 
		(bounded-walk -1.0 1.0 (ch -0.01 0.01))
	512))

(step-gen
	(seq table)
	(st 1))