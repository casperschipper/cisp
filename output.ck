fun Stream timedValue () {
return 
st.t(
  st.ch([ 10,50,100,200 ]),
  st.mup(
    st.ch([ 1,2,4,8,16 ]),0.1));
}
fun Stream casper () {
return 
st.t(
  st.boundedWalk(50,1000,
    st.mup(timedValue(),
      st.ch([ -1,1 ]))),
  st.mup(
    st.ch([ 1,2,4,8 ]),0.1));
}

function void superChuckFunc_1() { 
    SuperChuck sc;
    sc.instrument("ping");
    sc.timer(
  st.seq([ 0.1,0.1,0.1 ]));
    sc.freq(casper());
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
  st.seq([ 0.1,0.1,0.1 ]));
    sc.freq(casper());
    sc.duration(
  st.rv(1,2));
    sc.amp(
  st.rv(1,2));
    sc.start();
    day => now;
}
spork ~ superChuckFunc_2();

function void superChuckFunc_3() { 
    SuperChuck sc;
    sc.instrument("ping");
    sc.timer(
  st.seq([ 0.1,0.1,0.1 ]));
    sc.freq(casper());
    sc.duration(
  st.rv(1,2));
    sc.amp(
  st.rv(1,2));
    sc.start();
    day => now;
}
spork ~ superChuckFunc_3();

day => now;