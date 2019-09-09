fun Stream noisy () {
return 
st.latch(
    st.loop(
        st.rv(-1,1),
        st.ch(
  cs.grow(1,2,8)),
        st.ch(
  cs.grow(1,2,8))),
    st.ch(
  cs.grow(1,2,8)));
}
fun Stream spark () {
return 
st.latch(
    st.seq([
  st.st(1) $ Stream,
  st.latch(
      st.st(0),
      st.rv(100,2000))]),
    st.ch([100.,2000]));
}
fun Stream squarish () {
return 
st.latch(
    st.hold(
        st.seq([-1.,1]),
        st.hold(
            st.ch([1.,2,3,5,33,55,100,200,100,800]),
            st.ch([3.,5,1,1,1,1,10,200]))),
    st.ch([1.,3,2000,3000,100000]));
}
fun Stream sinesegment () {
return 
st.latch(
    st.sineseg(
        st.ch([
  st.rv(20,100) $ Stream,
  st.rv(10000,20000)])),
    st.ch([3.,5,10]));
}
fun Stream a () {
return 
st.line(
    st.seq([0.,5]),
    st.ch([0.100000000000,0.300000000000]));
}


fun void shred_1() {
StepSynth s => Safe safe =>dac;



s.init(
    st.index([noisy() $ Stream,spark(),squarish(),sinesegment()],
        st.rv(a(),a()))
,
    st.st(1)

);



day => now;
}
spork ~ shred_1();

<<<"shred id: ",me.id()>>>;
Event end;
(new ShredEventStack).push(end);
end => now;