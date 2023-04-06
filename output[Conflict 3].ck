fun Stream freq () {
return 
st.seq(
  st.linseg(
      st.ftom(
          st.walkList([3,30,1000,100,40,4000],
              st.hold(
                  st.seq([1.,2,33]),
                  st.seq([13.,17])))),
      st.ftom(
          st.walkList([5100.0,6000,4900,10,80,10000],
              st.hold(
                  st.seq([1.,2,33]),
                  st.seq([7.,23])))),
      st.walkList(
          cs.grow(3,2,12),
          st.hold(
              st.seq([1.,2,3300]),
              st.seq([1.,2,3,77,100])))));
}


fun void shred_1() {
StepSynth s => Safe safe =>dac;



s.init(
    st.sine(
        st.mtof(freq()))
,
    st.st(1)

);



day => now;
}
spork ~ shred_1();

<<<"shred id: ",me.id()>>>;
Event end;
(new ShredEventStack).push(end);
end => now;