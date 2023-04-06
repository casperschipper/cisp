(~ low
	(line
		(seq 0 14)
		(st (ch 31 29))))

(fun high 
	(line (seq 0 14)
		(ch 41 37)))

(# whiteTable
	(fillf 32 -1 1))

(
	line-gen
	(list-walk whiteTable (st 1))
	(index (1 2 3 4 5 12 13 23 40 50 11 4 7 2 1) (rv (~ low) high))
	:chan (num 0))

(
	line-gen
	(list-walk whiteTable (st 1))
	(index (1 2 3 4 5 12 13 23 40 50 11 4 7 2 1) (rv (~ low) high))
	:chan (num 1))

(
	line-gen
	(list-walk whiteTable (st 1))
	(index (1 2 3 4 5 12 13 23 40 50 11 4 7 2 1) (rv (~ low) high))
	:chan (num 2))

(
	line-gen
	(list-walk whiteTable (st 1))
	(index (1 2 3 4 5 12 13 23 40 50 11 4 7 2 1) (rv (~ low) high))
	:chan (num 3))

(
	line-gen
	(list-walk whiteTable (st 1))
	(index (1 2 3 4 5 12 13 23 40 50 11 4 7 2 1) (rv (~ low) high))
	:chan (num 4))

(
	line-gen
	(list-walk whiteTable (st 1))
	(index (1 2 3 4 5 12 13 23 40 50 11 4 7 2 1) (rv (~ low) high))
	:chan (num 5))

(
	line-gen
	(list-walk whiteTable (st 1))
	(index (1 2 3 4 5 12 13 23 40 50 11 4 7 2 1) (rv (~ low) high))
	:chan (num 6))

(
	line-gen
	(list-walk whiteTable (st 1))
	(index (1 2 3 4 5 12 13 23 40 50 11 4 7 2 1) (rv (~ low) high))
	:chan (num 7))