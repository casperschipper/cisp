fun Stream interval () {
return 
st.t(
    st.ch([1.,2,3,55,700,-3,-100,-20]),
    st.ch([0.100000000000,0.500000000000]));
}
fun Stream shifter () {
return 
st.line(
    st.rv(300,700),
    st.ch([0.100000000000,0.010000000000,4,7]));
}


    cs.fillf(32,-1,1) @=> float tab1[];

fun Stream a () {
return 
st.line(
    st.seq([0.,32]),
    st.ch([3.,5]));
}

function void superChuckFunc_1() { 
        SuperChuck s;
        
        s.instrument("voice");
s.addPar("amp",
  st.st(0.100000000000));
s.addPar("freq",
  st.reset(
      st.walk(300,interval()),
      st.sum(shifter(),shifter()),
      st.weights([[1,20],[20,2],[7,1]])));
s.addPar("number",
  st.line(
      st.ch([1400.,4,1500]),
      st.ch([1.,3,6])));
s.addPar("pan",
  st.index(tab1,
      st.rv(a(),a())));


        s.timer(
    st.line(
        st.seq([0.001000000000,0.010000000000,0.050000000000,0.100000000000]),
        st.rv(0.100000000000,0.400000000000)));
        s.play();
        day => now;
        } spork ~ superChuckFunc_1();

<<<"shred id: ",me.id()>>>;
Event end;
(new ShredEventStack).push(end);
end => now;