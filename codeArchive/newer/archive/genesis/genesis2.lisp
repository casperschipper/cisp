(# amp
    (fillf 16 -1 1))

(# pantab
    (fillf 256 -1 1))

(fun a 
    (line 
        (seq 1 1000)
        (ch 1 2 3)))

(clone 
(step-pan-gen
    (list-walk amp (bounded-walk (st 1) a (ch -1 1)))
    (t (ch 1 2 4 8 16 32 64 128 256 512 1024) (ch 0.01 0.1 0.2 0.5 1.5 3.0))
    (hold (seq pantab) 
        (ch (st 100000) 
            (weights ((1 100000) (1000 100))))))
10)
