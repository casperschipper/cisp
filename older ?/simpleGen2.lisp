(fun a
	(line (seq 1 1000) (ch .1 .2 .4 .8 1.6)))

(# tab1 (
	fillf 16 -1 1))

(# tab2 (fillf 16 1 100))


(fun toppy 
	(line (seq 0 16) (ch 1 2 4 8)))

(~ casper (write tab2 (rv 1 a) (rv 0 16)))

(write-schedule (~ casper) (ch 0.1 0.01 0.003))

(step-pan-gen
	(hold (seq -1 1) (index tab2 (rv toppy toppy)))
	(st 1)
	(hold (seq -1 1) (index tab2 (rv toppy toppy)))
)




