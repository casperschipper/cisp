/* 
Proof of concept,
4 types of stream, the first is the root, stays same for all, higher up is branching, because they allow more diversity

*/

(fun root 
(st 40))

(fun branch1
(line
(ch -5 5)
(ch 30 40)))

(fun branch2
(t
(ch -10 10)
(fractRandTimer (ch 0.1 0.2 2 8))))

(fun branch3
	(t 
	(rv (line (seq 0 -14) (st 100)) (line (seq 0 100 -15) (st 20)))
	(ch 0.0001 0.2 0.3)))


(~ ctrl1
(line
	(seq 0 0 1 1)
	(seq 5. 5.0 1000)))

(~ ctrl2
(line
	(seq 0 0 1 1)
	(seq 10. 5.0 1000)))

(~ ctrl3
(line
	(seq 0 0 1 1)
	(seq 15. 5.0 1000)))


(clone
(step-gen
	(seq (fillf 16 -1 1))
		(+
			(list 
			root (* branch1 (~ ctrl1)) (* branch2 (~ ctrl2)) (* branch3 (~ ctrl3))
		)) 
	 :pan (rvfi -1 1))
8)