(# buffy (collect (st 0) 1024))

(fun writeHead
	(write
		buffy
		(rv -1 1)
			
			(count 1024)))

(step-gen
	writeHead
	(st 1))

(step-gen
	(seq buffy)
	(st 1))


