(~ gater
	(rv 0 (slider 3 1 1)))


(clone
(step-gen
	(index-lin OSC.table9 (+ (+ (count2 128) (line (seq 0 512) (ch 1 2 5))) (* (> (~ gater) 10) (rv 0 (* (slider 3 1 1) 1)))))
	(st 3)
	:pan (rvfi -1 1)
	) 3)

