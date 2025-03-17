(fun mx
	(line (ch (grow 1 2 10)) (ch 1 2 3)))

(fun a
	(loop (ch -.1 .1) (rv 1 mx) (rv 1 mx)))

(step-gen
	(+ (list 
				a
				(hold a (st 2)) 
				(hold a (st 4)) 
				(hold a (st 8))
				(hold a (st 16))
				(hold a (st 32))
				(hold a (st 64))
				(hold a (st 128))
				(hold a (st 256))
				(hold a (st 512))
				(hold a (st 1024))
				(hold a (st 2048))
				(hold a (st 4096))
				(hold a (st 8192))
				(hold a (st 16384))
				(hold a (st 32678))))
	(st 1)
	:pan 0.5
)


