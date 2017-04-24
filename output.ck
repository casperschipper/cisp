

		cs.fillf(2,1,1) @=> float table[];

		cs.fillf(16,-1,1) @=> float amps[];

        class Procedure_1 extends Stream {
        st ST; // this is for namespace reasons, st is already used within Stream class.

        	 fun float next() {
        	
		cs.replacef(
				ST.collect(
						ST.ch([ST.st(7),ST.st(6),ST.st(4),
	ST.rv(20,25)]),
						cs.choose([4,8,16,32])),table);
        	}
        }
        Procedure_1 casper;

        class Procedure_2 extends Stream {
        st ST; // this is for namespace reasons, st is already used within Stream class.

        	 fun float next() {
        	
		cs.replacef(
				ST.collect(
						ST.rv(1000,20000),10),table);
        	}
        }
        Procedure_2 casper2;

        class Procedure_3 extends Stream {
        st ST; // this is for namespace reasons, st is already used within Stream class.

        	 fun float next() {
        	
		cs.replacef(
				ST.collect(
						ST.rv(-1,1),
						cs.choose([4,8,16,3])),amps);
        	}
        }
        Procedure_3 fillAmp;
st.schedule(
		st.seq([casper $ Stream,casper2]),
		st.seq([0.5,0.5]));
st.schedule(fillAmp,
		st.ch([0.1,0.2,0.4,0.8,10]));fun Stream stepper () {
return 
st.t(
		st.mup(
				st.rv(1,2),
				st.ch([-1,1])),
		st.ch([0.1,0.2]));
}
fun Stream app () {
return 
st.t(
		st.rv(1,300),
		st.ch([0.1,0.2,0.5]));
}
fun Stream looper () {
return 
st.loop(
		st.rv(app(),app()),
		st.ch([1,2,4,8]),
		st.ch([1,2,4,8]));
}


		
fun void shred_1() {
StepPanSynth s;

s.init(
				st.loop(
						st.seq(amps),looper(),looper())
,
				st.loop(
						st.seq(table),looper(),looper())
,
				st.t(
						st.rv(-1,1),
						st.fractRandTimer(0.0001))
);

day => now;
}
spork ~ shred_1();
;

		
fun void shred_1() {
StepPanSynth s;

s.init(
				st.loop(
						st.seq(amps),looper(),looper())
,
				st.loop(
						st.seq(table),looper(),looper())
,
				st.t(
						st.rv(-1,1),
						st.fractRandTimer(0.0001))
);

day => now;
}
spork ~ shred_1();
;

		
fun void shred_1() {
StepPanSynth s;

s.init(
				st.loop(
						st.seq(amps),looper(),looper())
,
				st.loop(
						st.seq(table),looper(),looper())
,
				st.t(
						st.rv(-1,1),
						st.fractRandTimer(0.0001))
);

day => now;
}
spork ~ shred_1();
;

		
fun void shred_1() {
StepPanSynth s;

s.init(
				st.loop(
						st.seq(amps),looper(),looper())
,
				st.loop(
						st.seq(table),looper(),looper())
,
				st.t(
						st.rv(-1,1),
						st.fractRandTimer(0.0001))
);

day => now;
}
spork ~ shred_1();
;

day => now;