(# tab1 (
	fillf 16 -1 1))

(# tab2 (fillf 16 1 100))

(procedure writeHead
	(write tab2 (rv 0 16) (exprv 1 1000 5)))

(schedule writeHead (st 1))

(fun toppy 
	(line (seq 0 16) (ch 1 2 4 8)))

(step-pan-gen
	(hold (seq -1 1) (index tab2 (rv toppy toppy)))
	(st 1)
	(hold (seq -1 1) (index tab2 (rv toppy toppy)))
)