

    cs.fillf(128,1.0,77) @=> float timy[];

        class Procedure_1 extends Stream {
        st ST; // this is for namespace reasons, st is already used within Stream class.

        	 fun float next() {
        	
    cs.replacef(
        ST.collect(
            ST.seq([
  ST.latch(
      ST.rv(1,15),
      ST.rv(1,8)) $ Stream,
  ST.latch(
      ST.rv(15,20),
      ST.rv(1,3)),
  ST.latch(
      ST.rv(1,3),
      ST.ch([1,7,20])),
  ST.latch(
      ST.ch([
  ST.hold(
      ST.rv(1,3),
      ST.st(100)) $ Stream,
  ST.rv(1,3)]),
      ST.ch([1,3,2,2,2,2,2,4,8]))]),128),timy);
        	}
        }
        Procedure_1 casper;
st.schedule(casper,
    st.t(
        st.ch([1,2,5,8,12]),
        st.ch([1,3,6,8,12])));fun Stream a () {
return 
st.line(
    st.seq([st.st(0),
  st.tableCap(timy)]),
    st.ch([5.0,7,32,2,0.010000000000]));
}
fun Stream sr () {
return 
st.mup(
    st.t(
        st.ch([0.001000000000,0.010000000000,0.000100000000,2]),
        st.ch([0.001000000000,0.100000000000,0.200000000000,0.600000000000])),
    st.t(
        st.ch([0.750000000000,1.500000000000,0.500000000000,3,4]),
        st.ch([1,2,5])));
}
fun Stream reader () {
return 
st.index([    st.line(        st.seq([a() $ Stream,a()]),sr()) $ Stream,    st.boundedWalk(a(),a(),        st.ch([-0.010000000000,0.010000000000]))],
    st.t(
        st.count(2),
        st.ch([1,2,5,8,12,16])));
}


    
fun void shred_1() {
StepPanSynth s;

s.init(
        st.indexLin([            st.seq([-1,1]) $ Stream,            st.rv(-1,1),            st.seq(  cs.fillf(32,-1,1)),            st.seq(OSC.table1),            st.seq(OSC.table2),            st.seq(OSC.table3)],reader())
,
        st.indexLin([            st.index(timy,reader()) $ Stream,            st.t(                st.rv(1,10),                st.ch([1,2,4,7,11,17,29]))],
            st.t(
                st.count(2),
                st.ch([1,2,4,8,12])))
,
        st.indexLin([            st.seq([-1,1]) $ Stream,            st.rv(-1,1),            st.seq(  cs.fillf(32,-1,1)),            st.seq(OSC.table1),            st.seq(OSC.table2),            st.seq(OSC.table3)],reader())
);

day => now;
}
spork ~ shred_1();
;

day => now;