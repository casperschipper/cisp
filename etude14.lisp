(~ indexer
	(t (rv 0 3) (ch (grow 0.001 2 12))))

(~ holder
	(line
		(seq 1 1000)
		(ch 0.1 0.5 1.5 4)))

(fun steppy
	(index
	
		(list 
		(seq (ch -0.01 -0.1) (rv 0.01 0.1))
		(hold (rv -0.1 0.1) (~ holder))
		(hold (seq -0.01 0.1) (~ holder))
		(t (rv -0.01 0.01) (fractRandTimer (ch 0.001 0.2 0.3 0.5 1.0)))
		)
	(~ indexer)))

(step-gen 
	(bouncy-walk (st -1) (st 1) steppy)
	(st 1) 
	:pan (rvfi -1 1))

(step-gen 
	(bouncy-walk (st -1) (st 1) steppy)
	(st 1) 
	:pan (rvfi -1 1))

(step-gen 
	(bouncy-walk (st -1) (st 1) steppy)
	(st 1) 
	:pan (rvfi -1 1))

(step-gen 
	(bouncy-walk (st -1) (st 1) steppy)
	(st 1) 
	:pan (rvfi -1 1))

(step-gen 
	(bouncy-walk (st -1) (st 1) steppy)
	(st 1) 
	:pan (rvfi -1 1))