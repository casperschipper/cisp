 (fun a 
	(line
		(ch 1 10 100)
		(ch 3 4 5)))

(fun stepper
	(hold
		(seq -1 1)
		(rv a a)))

(fun three
	(hold
		(list-walk (steno "kjsdhfkdjhbbbcbcbbcbbvjvbememnembwjdfbudihbdfhvbsbhdbfahaaajshdbfjhudvbvibivjbirebefvbsifbsfbvisfvnsjnfvjsfnbbnsjgbsgsbgbsfgbsfgbsgb") stepper)
		(list-walk (steno "skdjsjdhfghfgfhhfbfbrubjehbgfufbdjufverbvbvufbvhjkjvbdfvhjevbervjkebkvjevbbhdfhbhfhfhfhfhfhhfhfbfbfdbfbfdbdbbfdbfgdfg") stepper)))

(# table (steno "0.0 skjdfhksjdhfkajhdskjfahsdkfadsf"))

(fun holder
	(seq (steno "axaxaxaxaxaaaagdacaabababbacbabcabcbacbabaxxxxabxabxaxabxaxbxbxzzzhgjsdhjfhafuyerygbshrgbjkhsbjhvhsbdfgjsaaaaaaaashdbfhdabdfugbadfhgab")))

(fun lsize
	(t
		(list-walk (steno "jdhflajbfjhbhjfbvdfvabcuabuyeabprvbvuhbdjfvhbjkdabvh") (hold (seq -1 1) holder))
		(rv 0 4)))

(fun transpose
	(t
		(ch 1 2 3 4 10 20)
		(ch 0.5 0.5 0.5 0.5 2)))

(fun freq
	(* 
		(hold
		(list-walk (steno "9000 9100") (hold (seq three three) (ch three three)))
		(* (list-walk (grow 1 2 10) (hold (seq three three) (seq three three))) 1)) transpose) )

(sync 0.14)

(fun values
	(hold
	(rv -1 1)
	(rv 1000 30000)
	))

(step-pan-gen
(seq -1 1)
(/ 44100 (loop freq lsize (ch (steno "bbdfgfgfgfgffffgggfgfabbbbbbbbbcbcbcbbcbcdddcdcdcdcdcbdbbcdbcdbcbd"))))
(seq values values))al