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

(fun freq
	(* 
		(hold
		(list-walk (steno "1000..1000 19000..19100") (hold (seq -1 1) (ch three three)))
		(* (list-walk (fillf 20 1 10) (hold (seq three three) (seq three three))) 1)) transpose) )

(sync 0.14)

(fun ctrlStepSize
	(/ 0.00001
	(hold
		three three)))

(step-pan-gen
(bounded-walk (st -1) (st 1) (bounded-walk (st -0.1) (st 0.1) (+ (seq (* -1 ctrlStepSize) ctrlStepSize) (/ three 100))))
(st 1)
(bounded-walk (st -1) (st 1) (bounded-walk (st -0.1) (st 0.1) (+ (seq (* -1 ctrlStepSize) ctrlStepSize) (/ three 100)))))