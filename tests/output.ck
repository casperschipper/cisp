

    cs.fillf(2,1,100) @=> float table[];

    cs.fillf(16,-1,1) @=> float amps[];

        class Procedure_1 extends Stream {
        st ST; // this is for namespace reasons, st is already used within Stream class.

        	 fun float next() {
        	
    cs.replacef(
        ST.collect(
            ST.ch([ST.st(2),ST.st(4),ST.st(40),
  ST.st(
      cs.rv(1,100))]),
            cs.choose([4,100,200])),table);
        	}
        }
        Procedure_1 casper;

        class Procedure_2 extends Stream {
        st ST; // this is for namespace reasons, st is already used within Stream class.

        	 fun float next() {
        	
    cs.replacef(
        ST.collect(
            ST.rv(-1,1),
            cs.choose([2,4,16,32])),amps);
        	}
        }
        Procedure_2 fillAmp;
st.schedule(casper,
    st.ch([1,2,4]));
st.schedule(fillAmp,
    st.ch([0.333,1,2,4]));

    
fun void shred_1() {
StepSynth s => Safe safe =>Pan4 p => dac;

s.init(
        st.seq(amps)
,
        st.walkList(table,
            st.hold(
                st.ch([-1,1]),
                st.t(
                    st.ch([1,20,50,100,10000]),
                    st.ch([0.01,0.2,0.5,1.0]))))

);

p.pan(
      cs.rvf(-1,1));

day => now;
}
spork ~ shred_1();
;

    
fun void shred_1() {
StepSynth s => Safe safe =>Pan4 p => dac;

s.init(
        st.seq(amps)
,
        st.walkList(table,
            st.hold(
                st.ch([-1,1]),
                st.t(
                    st.ch([1,20,50,100,10000]),
                    st.ch([0.01,0.2,0.5,1.0]))))

);

p.pan(
      cs.rvf(-1,1));

day => now;
}
spork ~ shred_1();
;

    
fun void shred_1() {
StepSynth s => Safe safe =>Pan4 p => dac;

s.init(
        st.seq(amps)
,
        st.walkList(table,
            st.hold(
                st.ch([-1,1]),
                st.t(
                    st.ch([1,20,50,100,10000]),
                    st.ch([0.01,0.2,0.5,1.0]))))

);

p.pan(
      cs.rvf(-1,1));

day => now;
}
spork ~ shred_1();
;

    
fun void shred_1() {
StepSynth s => Safe safe =>Pan4 p => dac;

s.init(
        st.seq(amps)
,
        st.walkList(table,
            st.hold(
                st.ch([-1,1]),
                st.t(
                    st.ch([1,20,50,100,10000]),
                    st.ch([0.01,0.2,0.5,1.0]))))

);

p.pan(
      cs.rvf(-1,1));

day => now;
}
spork ~ shred_1();
;

day => now;