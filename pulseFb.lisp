(# tab1 
	(fillf 44100 0 0))

(samp-schedule
	(write tab1 (audioIn 0) (count (table-cap tab1)))
	(st 1))
	


(fun pan
	(t (rv -1 1)
	(fractRandTimer (ch 0.01 0.01 0.2 0.3 1.0))))

(fun freq
	(t (ch 10 20 30 100 (rf 40 50) (rv 1 10000))
		(fractRandTimer (ch 0.1 0.2 3.0 0.01))))

(fun feedb
	(line (seq -0.1 0.1 0.2 0.5 -0.5 0.9)
		(ch 0.1 0.2 0.3 1.0)))

(fun transer
	(t 
		(seq 2.0 0.5)
		(ch 0.25 0.5 1.0 2.0 3.0 5.0 10.0)))

(clone 
(pulse-fb-gen (index-lin tab1 (bounded-walk (st 0) (table-cap tab1) transer)) (st 1) pan freq feedb)
3)