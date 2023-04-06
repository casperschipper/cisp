(fun three
	(hold
		(seq (steno "kjsdhfkdjhbbbcbcbbcbbvjvbememnembwjdfbudihbdfhvbsbhdbfahaaajshdbfjhudvbvibivjbirebefvbsifbsfbvisfvnsjnfvjsfnbbnsjgbsgsbgbsfgbsfgbsgb"))
		(seq (steno "skdjsjdhfghfgfhhfbfbrubjehbgfufbdjufverbvbvufbvhjkjvbdfvhjevbervjkebkvjevbbhdfhbhfhfhfhfhfhhfhfbfbfdbfbfdbdbbfdbfgdfg"))))

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
		(list-walk (steno "4400..4500 8000..8010 14000..15000") (hold (seq three three) (ch three three)))
		(* (list-walk (grow 1 1.5 10) (hold (seq three three) (seq three three))) 1)) transpose) )

(sync 0.14)

(fun values
	(hold
	(rv -1 1)
	(rv 1000 30000)
	))

(step-pan-gen
(seq values values)
(/ 44100 (loop freq lsize (st 30)))
(seq values values))