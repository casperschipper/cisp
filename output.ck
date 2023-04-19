fun Stream harm () {
return 
st.t(
    st.rv(0.990000000000,1.0),
    st.ch(5.0));
}
fun Stream mupper () {
return 
st.boundedMupWalk(
    st.st(0.500000000000),
    st.st(8.0),
    st.div(harm(),harm()));
}

function void superChuckFunc_1() { 
        SuperChuck s;
        
        s.instrument("simple");
s.addPar("freq",
  st.mup(
      st.mup(
          st.st(400),
          st.div(harm(),harm())),
      st.t(mupper(),
          st.ch([0.500000000000,1.0,2.0,4.0]))));
s.addPar("dur",
  st.line(
      st.seq([0.500000000000,15.0]),
      st.ch([1.,3,5,7,8])));
s.addPar("amp",
  st.st(0.010000000000));
s.addPar("pos",
  st.rv(-1,1));


        s.timer(
    st.line(
        st.seq(0.010000000000),
        st.st(4)));
        s.play();
        day => now;
        } spork ~ superChuckFunc_1();

<<<"shred id: ",me.id()>>>;
Event end;
(new ShredEventStack).push(end);
end => now;