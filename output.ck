fun Stream freqStep () {
return 
st.line(
    st.ch([
  st.seq([-100,-333],true),st.st(-1),
  st.seq([
  st.latch(
      st.st(-10),
      st.st(10)),st.st(-3033)],true),st.st(-200),st.st(-300),
  st.seq([10,200,30],true)]),
    st.t(
        st.rv(1,4),
        st.ch([1,2,4])));
}
fun Stream panStep () {
return 
st.line(
    st.ch([st.st(-1.0),st.st(-0.1),st.st(0.001),st.st(0.1),
  st.t(
      st.rv(-1,1),
      st.ch([0.1,0.001,0.1,1.0]))]),
    st.t(
        st.ch([1,2,4]),
        st.ch([1,2,4])));
}

function void superChuckFunc_1() { 
        SuperChuck sc;
        sc.instrument("simpleSine");
sc.addPar("duration",
  st.line(
      st.ch([0.1,0.01,0.05,0.2,0.01,5.0]),
      st.ch([0.1,0.2,0.4,0.8,1.6])));
sc.addPar("freq",
  st.boundedWalk(
      st.st(20),
      st.t(
          st.rv(10,20000),1),freqStep()));
sc.addPar("pan",
  st.boundedWalk(-1,1,panStep()));

        sc.timer(
    st.t(
        st.ch([st.st(0.01),st.st(0.02),st.st(0.001),
  st.rv(0.1,1.0)]),
        st.ch([1,2,3])));
        sc.play();
        day => now;
        } spork ~ superChuckFunc_1();

day => now;