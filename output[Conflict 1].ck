fun Stream bigOrSmall () {
return 
st.t(
    st.seq([
  st.weights([[1,100],[1000,10]]) $ Stream,
  st.rv(1,3),
  st.rv(1,55)]),
    st.ch(
  cs.grow(0.100000000000,2,7)));
}
fun Stream topper () {
return 
st.line(
    st.ch([
  st.ch(
  cs.grow(1,2,3)),st.st(0.001000000000),st.st(0.000200000000)]),
    st.ch([0.100000000000,4,8,16]));
}
fun Stream slider () {
return 
st.t(
    st.seq([bigOrSmall() $ Stream,bigOrSmall(),bigOrSmall(),bigOrSmall(),bigOrSmall(),bigOrSmall()]),
    st.rv(0,topper()));
}
fun Stream foo () {
return 
st.index([st.ch([0,1]) $ Stream,st.hold(    st.seq([0,1]),    st.rv(1,10)),st.hold(    st.seq([0,1]),    st.ch(  cs.grow(1,2,8)))],
    st.t(
        st.ch([0,1,2,3]),
        st.st(1)));
}
fun Stream panner () {
return 
st.index([st.rv(-1,1) $ Stream,st.hold(    st.seq([-1,1]),    st.rv(1,10)),st.hold(    st.rv(-1,1),    st.ch(  cs.grow(1,2,8)))],
    st.t(
        st.ch([0,1,2,3]),
        st.st(1)));
}


    
fun void shred_1() {
StepPanSynth s;

s.init(
        st.seq(
  st.collect(
      st.mup(
          st.exprv(0,1,5),
          st.ch([-1,1])),1024)).max(
          st.t(
              st.ch([4,6,1024,8,512]),
              st.ch([0.100000000000,0.200000000000,0.400000000000,0.800000000000,1.600000000000,3.200000000000])))
,
        st.t(
            st.index([slider() $ Stream,slider()],foo()),topper())
,
        st.t(panner(),
            st.fractRandTimer(0.000100000000))
);

day => now;
}
spork ~ shred_1();
;

day => now;