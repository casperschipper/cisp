(# amp
    (fillf 256 -1 1))

(# pantab
    (fillf 256 -1 1))

(fun a 
    (line 
        (seq 1 1000)
        (ch 1 2 3)))

(step-pan-gen
    (list-walk amp (bounded-walk (st 1) a (ch -1 1)))
    (st 1024)
    (hold (seq pantab) (weights ((0 1000000) (1 10000) (2 1)))))
