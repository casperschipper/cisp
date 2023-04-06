(fun a 
	(hold
		(seq (steno "jshfoiwejhnfvieonvjosnrvisnvoismronvsnirovsmeirvsovrvorsmovimseorv"))
		(seq (steno "dksjfhuerfguiebiva uribvapieruvbnaiuvblhbvlhsblvaebrvbhlervbbhvsejrbhvlsjrhbvls"))))

(fun stepper
	(hold
		(seq -1 1)
		(rv a a)))

(fun three
	(+ (hold
		(list-walk (steno "sjdhfgsdjhfbajvhbcadhbcvjasdcvgcvbcgiuavbeucbaeibaifhbieha") stepper)
		(list-walk (steno "asgdsfbsdvfbsdvfbsvdbcbcnbbsbsbdbsndnsbdfsdsbsbsbjshfgjshdgfkjahguehbflhebvlfuhabefhblaes") stepper)) 1))

(# table (steno "0.0 skjdfhksjdhfkajhdskjfahsdkfadsf"))

(fun holder
	(seq (steno "bbbbebbebebbebefgehfbefbfhebfegfbehfgefhegbfhegef")))

(fun lsize
	(t
		(list-walk (steno "jdhflajbfjhbhjfbvdfvabcuabuyeabprvbvuhbdjfvhbjkdabvh") (hold (seq -1 1) holder))
		(rv 0 4)))

(fun transpose
	(t
		(rv 1 10)
		(fractRandTimer (ch 0.1 0.5 1.0 2))))

(sync 0.14)

(fun ctrlStepSize
	(/ 0.00001
	(hold
		three three)))

(# history (fillf 441000 0 0))


(~ writeBuff 
	(write history (bounded-walk (st -1) (st 1) (bounded-walk (st -0.1) (st 0.1) (+ (seq (* -1 ctrlStepSize) ctrlStepSize) (/ three 100)))) 
		(count (table-cap history))))

(fun offset
	(line 
		(seq 0 44100)
		(ch 30 40 10 1)))

(schedule
	(~ writeBuff)
	(st 0.001))

(step-pan-gen
(index history (+ (hold offset 4) (count2 (hold (ch 16 32 64 128 32 512) (ch 3 4 5 6)))))
(st 1)
(index history (+ (hold offset 4) (count2 (hold (ch 16 32 64 128 32 512) (ch 3 4 5 6))))))