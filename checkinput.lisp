(# tab1 (fillf 44100 0 0))

(samp-schedule 
	(write tab1 (audioIn 0) (count (table-cap tab1)))
	(st 1))

(step-gen
(index-lin tab1 (bounded-walk (st 0) (table-cap tab1) (line (seq 0 4) (ch .3 .5 1.))))
(st 1))