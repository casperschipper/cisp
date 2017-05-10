

fun void shred_1() {
PulseSynth s => Safe safe => dac;

s.init(
		st.index([st.rv(-1,1) $ Stream,st.seq([-1,1]),st.seq(	cs.fillf(256,-1,1))],
				st.t(
						st.count(3),
						st.st(1)))
,
		st.hold(
				st.index([1,22,33,55,6,6,628,348,2,234,23,43,3,3,423,21,12,4234,2,323,34,44,444],
						st.count2(
								st.rv(1,20),true)),
				st.ch([1,2,4,1000]))

);



day => now;
}
spork ~ shred_1();

day => now;