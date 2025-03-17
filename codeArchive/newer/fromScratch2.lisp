// hello world! I'll be programming some CISP (my tool for writing lisp and generate chuck)..
// here we go.. i'll go from scratch so wish me luck..

(# tab1 (fillf 44100 0 0))

(samp-schedule
	(write tab1 (* (audioIn 0) 5) (count 44100))
	(st 1))

(fun noisyness 
	(+ 
		(line
		(seq 0 44100)
		(fractRandTimer
			(ch 0.999 1.001 1.0 2.0 0.1 0.2 0.5 2.5)))
		))

(clone 
(step-gen
	(hpf (index tab1 noisyness) 1000 0.1)
	(st 1)
	:pan (rvfi 0 1))
	8)


// thanks!