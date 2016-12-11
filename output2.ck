

SuperChuck sc;
sc.instrument("ping");
sc.timer(
  st.boundedMupWalk(100,1000,
    st.ch([ 0.5,2.0 ])));
sc.freq(
  st.rv(1,2));
sc.duration(
  st.rv(1,2));
sc.amp(st.st(0.1));
sc.start();

day => now;

