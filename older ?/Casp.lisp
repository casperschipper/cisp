This is an attempt to see what would happen if a scheme syntax is used.

The syntax has a few features:
- automatically make lists of functions called with more arguments, for example, choice normally takes a list as argument.

- if seq is called with more arguments, make a list
(seq 1 2 3) makes st.seq([1,2,3])
(seq 1 2 3 true) should make st.seq([1,2,3,4],true)
(seq '(1 2 3) true) should make st.seq([1,2,3,4],true)
(seq (seq 1 2) seq(10 11) seq(10 20 30)) 

loop( boundedMupWalk(100,1000,seq([foo(),foo(),foo(),foo()])) , ch([32,16,64]), ch([1,3,2,4]))

(loop 
	(boundedMupWalk 100 1000 (seq (foo foo foo foo)))
	(ch 32 16 64) 
	(ch 1 2 3 4)
)

(bus casper)
// reading a bus
bus("casper")

(bus casper (rv 1 10))
// writing a bus
st.bus("casper",rv(1,10));

(index (10 11 12) (rv 0 2))
// using index
st.index([10,11,12], st.rv(0,2))

(fill 32 -1.0 1.0)
// fill a table
cs.fillf(32 -1 1)

(seq (fill 32 -1 1))
// should make
st.seq( cs.fill(32,-1,1) );


st.rv(-1,1).collect(32)
// collecting a list
(collect (rv -1 1))

casper = { (rv 1 10) }

fun Stream casper () {
	return st.rv(1,10);
}

assign a stream...
(~ casper (rv 1 10))
just names a bus
st.bus("casper", rv(1,10) );

(+ ch(1,10,100) seq(1,2,3));


st.rv(1,10) @=> Stream casper;

(~ amp (+ 3 1 4))

(stepgen 
	(~ amp) 
	(~ time))


(f casper (rv 1 10))

fun Stream casper () {
	return st.rv(1,10);
}

(defun casper (a b) (rv a b))

fun Stream casper(Stream a, Stream b) {
	return st.rv(a,b);
}

'fun Stream' + name + '() { return st.rv(1,10)'

(loop (boundedMupWalk 100 100 seq((foo foo foo foo)))