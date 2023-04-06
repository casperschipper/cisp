
(fun offset
	(line
		(seq 0 100)
		(ch 4 7 11 22)))

(fun size
	(sometimes (ch 2 20) (line (rv 0 111) (rv 0.1 0.4)) 3))

(fun ffreq
	(t
		(rf 1 128)
		(fractRandTimer (ch 0.1 0.01 0.5 1. 2. 4))))

(fun filt (input)
	(biquad input 1 ffreq 0.9 1.0))


(fun a
	(line
		(seq 0 1)
		(fractRandTimer (ch 0.01 0.1 0.5 1 1.5 3))))

(fun b
	(line
		(seq 1 50)
		(fractRandTimer (ch 0.01 0.1 0.5 1 1.5 3))))



(step-pan-gen

(filt
	(trig 
		(index OSC.table1 (+ (count2 size true) offset)) 

		(sometimes 1 0 (line (seq 1 1000) (ch 1 3 7 11))))
	)
(st 1)

(hold (rv a a) (rv b b))
)