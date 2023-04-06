(fun gater
	(rv 0 (slider 3 1 1)))

(clone
(step-gen
	(index-lin OSC.table9 (+ (+ (count2 128) (* (line (seq 0 4) (ch 1 2 5)) (slider 3 1 2)) ) (* (> gater 10) (rv 0 (* (slider 3 1 1) 1)))))
	(st 4)
	:pan (rvfi -1 1)
	) 3)


