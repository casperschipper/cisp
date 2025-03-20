

    cs.fillf(1,0,0) @=> float tab1[];



fun void shred_1() {
StepSynth s => Safe safe =>Pan4 p => dac;


s.init(
    st.mup(0.010000000000,
        st.write(tab1,
            st.boundedWalk(0,100,
                st.boundedWalk(0,100,
                    st.indexLin(OSC.table4,
                        st.sum(
                            st.seq(tab1),
                            st.line(
                                st.ch([0.0,1]),
                                st.ch([1.,2,3,4,5])))))),
            st.s(0)))
,
    st.s(1)

);


p.pan(
  cs.rvf(-1,1));

day => now;
}
spork ~ shred_1();

<<<"shred id: ",me.id()>>>;ShredEventStack stack;
ShredEvent end;
stack.push(end);
end => now;