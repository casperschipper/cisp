(~ low
	(line
		(seq 0 5)
		(st (ch 3 7 29))))

(fun high 
	(line (seq 0 5)
		(ch 3 7 1 37)))

(# whiteTable
	(collect (* (exprv 0 1 10) (seq -1 1)) 128))

(fun magic
	(index (10 1 (rv 1 1000) 2 5) (rv (line (seq 0 5) (ch 31 29)) (line (seq 0 5) (ch 31 29))))
	)

(
	line-gen
	(list-walk whiteTable (st 1))
	(index (1 2 3 7 magic) (rv (~ low) high))
	:chan (num 0))

(
	line-gen
	(list-walk whiteTable (st 1))
	(index (1 2 3 7 magic) (rv (~ low) high))
	:chan (num 1))

(
	line-gen
	(list-walk whiteTable (st 1))
	(index (1 2 3 7 magic) (rv (~ low) high))
	:chan (num 2))

(
	line-gen
	(list-walk whiteTable (st 1))
	(index (1 2 3 7 magic) (rv (~ low) high))
	:chan (num 3))

(
	line-gen
	(list-walk whiteTable (st 1))
	(index (1 2 3 7 magic) (rv (~ low) high))
	:chan (num 4))

(
	line-gen
	(list-walk whiteTable (st 1))
	(index (1 2 3 7 magic) (rv (~ low) high))
	:chan (num 5))

(
	line-gen
	(list-walk whiteTable (st 1))
	(index (1 2 3 7 magic) (rv (~ low) high))
	:chan (num 6))

(
	line-gen
	(list-walk whiteTable (st 1))
	(index (1 2 3 7 magic) (rv (~ low) high))
	:chan (num 7))