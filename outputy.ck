fun Stream transS () {
return 
st.t(
    st.ch([1.0,2,0.5,1.5,0.666666667]),
    st.ch([2,3,5,7]));
}
fun Stream trans () {
return 
st.seq([transS() $ Stream,transS()]);
}
fun Stream pitch () {
return 
st.hold(
    st.mup(
        st.seq([100,200,333,400]),trans()),
    st.index([4,2,1,1,2,4,7],
        st.hold(
            st.count(7),
            st.weights([[1,100],[2,10]]))));
}
fun Stream onePan () {
return 
st.t(
    st.rv(-1,1),
    st.ch([1,2,5,7]));
}


    function void superChuckFunc_1() { 
        SuperChuck sc;
        sc.instrument("saw");
sc.addPar("duration",
      st.line(
          st.seq([0.5,0.1]),
          st.seq([5,7,2,14])));
sc.addPar("freq",
      st.mup(
          st.seq([pitch() $ Stream,pitch()]),
          st.rv(0.999,1.001)));
sc.addPar("pos",
      st.seq([onePan() $ Stream,onePan()]));

        sc.timer(
        st.mup(
            st.seq([0.12,0.1]),1.0));
        sc.play();
        day => now;
        } spork ~ superChuckFunc_1();
;

day => now;