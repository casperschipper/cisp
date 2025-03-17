

    cs.fillf(44100,0,0) @=> float table1[];

fun Stream sqrsig () {
return 
st.mup(
    st.line(
        st.seq([0.,0.100000000000,0.100000000000,0]),
        st.seq([0.010000000000,4.0,0.010000000000,100.0])),
    st.hold(
        st.seq([-1.,1]),
        st.s(100)));
}


fun void shred_1() {
StepSynth s => Safe safe =>dac;



s.init(
    st.write(table1,
        st.sum([            st.seq(table1) $ Stream,            st.mup(0.100000000000,                st.index(table1,                    st.line(                        st.seq([0.,44100]),                        st.ch([0.010000000000,0.001000000000,2.0,4.0,8.0,0.500000000000,1.500000000000,1.0])))),sqrsig()]),
        st.count(
            st.tableCap(table1)))
,
    st.s(1)

);




day => now;
}
spork ~ shred_1();

<<<"shred id: ",me.id()>>>;
            ShredEvent end;
            "memory4" @=> end.name;
            ShredEventStack stack;
            stack.push(end);
            end => now;
            