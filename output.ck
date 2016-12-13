fun Stream timedValue () {
return 
st.t(
  st.ch([ 10,50,100,200 ]),
  st.ch([ 1,2,4,8 ]));
}
fun Stream casper () {
return 
st.t(
  st.boundedWalk(50,1000,
    st.mup(timedValue(),
      st.ch([ -1,1 ]))),
  st.ch([ 1,2,4,8 ]));
}

function void superChuckFunc_1() { 
    SuperChuck sc;
    sc.instrument("ping");
    sc.timer(
  st.seq([ 0.13,0.1,0.1 ]));
    sc.freq(
  st.index(
    [casper(),casper(),casper()],
    st.boundedWalk(0,5,
      st.t(
        st.ch([ -1,1 ]),30))));
    sc.duration(
  st.rv(1,2));
    sc.amp(
  st.rv(1,2));
    sc.start();
    day => now;
}
spork ~ superChuckFunc_1();

function void superChuckFunc_2() { 
    SuperChuck sc;
    sc.instrument("ping");
    sc.timer(
  st.seq([ 0.13,0.1,0.1 ]));
    sc.freq(
  st.index(
    [casper(),casper(),casper()],
    st.boundedWalk(0,5,
      st.t(
        st.ch([ -1,1 ]),30))));
    sc.duration(
  st.rv(1,2));
    sc.amp(
  st.rv(1,2));
    sc.start();
    day => now;
}
spork ~ superChuckFunc_2();

day => now;