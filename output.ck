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


    cs.sine(16,[1.0]) @=> float tab1[];

fun Stream a () {
return 
st.line(
    st.seq([st.st(0),
  st.tableCap(tab1)]),
    st.ch([0.100000000000,3,5]));
}

 st.define("casper",100);

 fun Stream latcher () {
return 
st.t(
    st.ch([10.,20,100]),
    st.ch([0.100000000000,0.500000000000,1,2]));
}

function void superChuckFunc_1() { 
        SuperChuck s;
        
        s.instrument("voice");
s.addPar("amp",
  st.st(0.100000000000));
s.addPar("freq",
   st.wr("casper",
      st.apply(
          st.rd("casper") ,[st.guardTest(    st.smaller(10),    st.sum(100))$ Guard,st.guardTestValue(    st.bigger(10000),    st.st(100)),st.otherwise(    st.seq([  st.latch(      st.sum(          st.rd("casper") ,          st.ch([100.,99,101])),latcher()) $ Stream,  st.latch(      st.mup(          st.rd("casper") ,          st.ch([2.0,0.500000000000])),latcher())]))])) );
s.addPar("number",
  st.line(
      st.ch(1000),
      st.ch([1.,3,6])));
s.addPar("pan",
  st.index(tab1,
      st.rv(a(),a())));


        s.timer(
    st.line(
        st.seq([0.010000000000,0.100000000000]),
        st.ch([1.0,3.0,8.0])));
        s.play();
        day => now;
        } spork ~ superChuckFunc_1();

<<<"shred id: ",me.id()>>>;
Event end;
(new ShredEventStack).push(end);
end => now;