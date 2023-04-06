(fun gater
	(rv 0 (slider 2 1 1)))

(clone
(step-gen
	(index-lin OSC.table9 (+ (+ (count2 128) (* (line (seq 0 4) (ch 1 2 5)) (slider 3 1 2)) ) (* (> gater 10) (rv 0 (* (slider 2 1 1) 1)))))
	(st 3)
	:pan (rvfi -1 1)
	) 3)

(clone
(step-gen
	(index-lin OSC.table9 (+ (+ (count2 128) (* (line (seq 0 4) (ch 1 2 5)) (slider 3 1 2)) ) (* (> gater 10) (rv 0 (* (slider 2 1 1) 1)))))
	(st 2)
	:pan (rvfi -1 1)
	) 3)

(clone
(step-gen
	(index-lin OSC.table9 (+ (+ (count2 128) (* (line (seq 0 4) (ch 1 2 5)) (slider 3 1 2)) ) (* (> gater 10) (rv 0 (* (slider 2 1 1) 1)))))
	(st 1)
	:pan (rvfi -1 1)
	) 1)


