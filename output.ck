

fun void shred_1() {
StepSynth s => Safe safe =>dac;



s.init(
    st.guardedWalk(-1,[st.guardTest(    st.bigger(1),    st.overwrite(-1))$ Guard,st.guardTest(    st.smaller(1),    st.sum(        st.walkList([0,0,0,0.010000000000,0.000100000000,0.002000000000],            st.ch([-1.,1]))))])
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