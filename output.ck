

SuperChuck sc;
sc.instrument("ping");
sc.timer(
  st.ch([ 0.1,0.2,0.3,0.4 ]));
sc.freq(
  st.boundedMupWalk(100,1000,
    st.ch([ 0.5,2.0 ])));
sc.duration(
  st.rv(1,2));
sc.amp(
  st.rv(1,2));
sc.start();

day => now;

