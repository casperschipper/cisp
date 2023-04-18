fun Stream top () {
return 
st.line(
    st.seq([0.010000000000,3.0]),
    st.ch([2.0,3.0,4.0]));
}
fun Stream harm () {
return 
st.t(
    st.ch([1.,4,0.100000000000,8]),
    st.ch([0.100000000000,0.200000000000]));
}

function void superChuckFunc_1() { 
        SuperChuck s;
        
        s.instrument("simple");
s.addPar("freq",
  st.mup(
      st.st(400),
      st.div(harm(),harm())));
s.addPar("amp",
  st.st(0.030000000000));
s.addPar("dur",
  st.line(
      st.seq(6.0),
      st.ch([0.100000000000,0.300000000000,1.0,5.0])));
s.addPar("pos",
  st.line(
      st.seq([-1.,1]),
      st.fractRandTimer(
          st.ch([0.010000000000,0.100000000000,0.200000000000,0.300000000000,1.0,4.0]))));


        s.timer(
    st.line(
        st.ch([0.010000000000,0.100000000000]),
        st.ch([3.,7,9])));
        s.play();
        day => now;
        } spork ~ superChuckFunc_1();

<<<"shred id: ",me.id()>>>;
Event end;
(new ShredEventStack).push(end);
end => now;