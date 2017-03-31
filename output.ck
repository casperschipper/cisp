fun Stream bnd () {
return 
st.t(
    st.rv(1,10),
    st.ch([0.1,0.2,0.8,1.6,5]));
}
fun Stream foo () {
return 
st.index([    st.seq(        cs.sine(16,[1.0])),    st.ch([1,10]),    st.rv(1,200),    st.ch([100,1]),st.st(3),st.st(4),bnd(),st.st(1),bnd(),st.st(1),bnd(),st.st(2),st.st(1)],
    st.rv(bnd(),bnd()));
}
fun Stream repeats () {
return 
st.index([st.st(1),st.st(1),st.st(1),st.st(1),st.st(1),st.st(1),st.st(1),st.st(1),st.st(1),st.st(1),    st.ch([1,2,4,8,16,32])],
    st.rv(0,11));
}
fun Stream octaver () {
return 
st.t(
    st.ch([0.5,0.25,0.125,0.06125,2]),
    st.fractRandTimer(0.0001));
}


    
fun void shred_1() {
StepSynth s => Safe safe => dac;

s.init(
        st.seq(
            st.collect(
                st.index([                    st.walk(0,                        st.ch([-0.1,0.1])),                    st.hold(                        st.ch([-1,1]),                        st.rv(1,10)),                    st.seq(                        cs.sine(128,[1.0,-1.0,2.0,1.0,0.5,1.0]))],
                    st.hold(
                        st.rv(0,3),
                        st.ch([16,8,2,32]))),128))
,
        st.loop(
            st.mup(
                st.index([                    st.rv(1,3),st.st(2),st.st(3),st.st(4),foo(),st.st(6),                    st.ch([1,4]),st.st(8),st.st(4),st.st(10)],
                    st.rv(bnd(),bnd())),octaver()),repeats(),
            st.ch([1,2,4,8,16,32,128]))

);

day => now;
}
spork ~ shred_1();
;

day => now;