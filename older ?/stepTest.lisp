(fun aaa
	(line (seq -100 100) (ch 1 4 5 7)))


(fun casper 
	(mtof 
		(line (seq aaa aaa) (ch .1 .2 .4 .8 1.6 3.2))))

(clone
(step-gen
(seq -1 1)
(list-walk (collect (exprv 1 10 10) 32) (hold (ch -1 1) casper ))
:pan (rvfi -1 1)) 
1)