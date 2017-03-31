
st.bus(
st.t(
    st.rv(1,10),
    st.ch([0.1,0.2,0.3,0.4])),"top");
st.bus(
st.t(
    st.rv(1,10),
    st.ch([0.1,0.2,0.3,0.4])),"bottom");

fun void shred_1() {
StepSynth s => Safe safe => Pan2 p => dac;

p.pan(cs.rvf());

s.init(
    st.seq([-1,1])
,
    st.index([        st.rv(1,10),st.st(2),        st.t(            st.rv(200,300),st.ch([0.1,0.2,0.3])),st.st(4),        st.line(            st.seq([1,100]),            st.ch([1,2,3])),st.st(6),st.st(7),st.st(8),st.st(9),        st.ch([1,10,100,1000])],
        st.rv(
st.bus("bottom"),
st.bus("top")))

);

day => now;
}
spork ~ shred_1();

day => now;