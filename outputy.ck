fun Stream verySlowOctaver () {
return 
st.t(
    st.ch([0.125,0.25,0.5,1.0]),
    st.ch([16,32,64]));
}
fun Stream alpha () {
return 
st.t(
    st.seq([1,8]),
    st.mup(
        st.ch(
            cs.grow(0.0001,2,8)),verySlowOctaver()));
}
fun Stream slowFielder () {
return 
st.t(
    st.rv(1,128),
    st.rv(1,40));
}


    
fun void shred_1() {
StepSynth s => Safe safe =>Pan2 p => dac;

s.init(
        st.seq(
            cs.fillf(128,-1,1)).max(slowFielder())
,
        st.index([st.rv(1,                cs.rv(1,10)),            st.st(                cs.rv(5,10)),            st.t(                st.seq([1,10]),alpha()),            st.st(                cs.rv(10,30)),st.st(10),            st.ch([10,20])],
            st.line(
                st.seq([alpha() $ Stream,alpha()]),
                st.fractRandTimer(0.0001)))

);

p.pan(cs.rvf());

day => now;
}
spork ~ shred_1();
;

day => now;