(fun muppy
	(t (ch 1 3 5 7)
		(fractRandTimer (ch 0.0001 0.4 0.5 1.0 5.0))))

(fun three
	(t (ch 3 30 300 3000 3 -1 -2)
		(fractRandTimer (list-walk (0.0001 0.5 1.0 2.0 5.0 ) (ch -1 1)))))

(fun holder
	(t (seq 1 (rv 100 20000))
		(ch 0.1 0.4 0.8 3.2)))

(clone 
(step-pan-gen
	(list-walk OSC.table9 (hold 
		(* (ch 1 three) muppy)
		holder))
	(st 1)
	(list-walk OSC.table9 (hold 
		(* (ch 1 three) muppy)
		holder)
	))
1)