(fun foo
(t
	(ch (collect (/ 1.0 (rf 40 120)) 30))
	(fractRandTimer (grow 0.001 2 12)))
)

(clone
(step-gen
(seq 
	(tlatch (st -1) (st foo))
	(tlatch (st 1) (st foo))
	(latch (loop (rv -1 1) (st 64) (st 8)) (rv 1 3))
	)
(st 1)
:pan (rvfi -1 1))
4)