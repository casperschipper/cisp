(fun a
	(t
		(hold (list-walk (100. 200 300 400 500 600 700 800 1000 1200 1400 1600) (seq 1 1 1 -2)) (weights ((1 100) (2 1))))
		(st 0.14)))

(sync 0.14)



(clone
(step-gen
	(t (seq -.1 .1) (/ 1 a))
	(st 1)) 2)