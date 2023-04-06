(fun foo
	(line (ch 1 2 3 4 1000 100) (ch 0.01 0.1 0.5)))

(clone 
(step-gen 
	(index OSC.table9 (+ (hold (rv 0 512) foo) (count2 (hold (ch (grow 1 2 10)) foo))))
	(st 1) :pan (rvfi -1 1))

1)