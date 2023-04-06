(fun foo (t (exprv 0.001 10 3) (ch 0.001 0.1 0.2 0.3 0.4 1.0 2.0) ))

(fun accell
	(t (seq (* -1 foo) foo) (ch (grow 0.01 2 10))))

(fun ampy
	(bouncy-walk -1 1 (bouncy-walk (* -1 foo) (* foo 1) (bouncy-walk (* -1 foo) (* foo 1) (bouncy-walk (* -1 foo) (* foo 1) accell)))))

(fun timy
	(st 1))

(fun panGen 
	(index 
		(list (rv -1 1) (seq (sine 32 (1.0))) (ch -1 1) (bounded-walk -1 1 (ch -0.01 0.01))) 
		(t (rv 0 5) (ch 0.01 0.1 0.2)) )))

(clone
(step-pan-gen
	(* ampy 0.1)
	timy
	(t panGen (fractRandTimer 0.001)))
2)