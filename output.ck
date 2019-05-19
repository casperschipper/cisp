

    cs.fillf(441,0,0) @=> float history[];

fun Stream indexer () {
return 
st.sum(
    st.count(127),
    st.mup(
        st.mtof(
            st.line(
                st.seq([-40.,40]),
                st.seq([1.,3,2]))),
        st.seq(history)));
}


fun void shred_1() {
StepSynth s => Safe safe =>dac;



s.init(
    st.write(history,
        st.indexLin(
            cs.sine(64,[1.0]),indexer()),
        st.count(
            st.tableCap(history)))
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