

    cs.fillf(128,-1,1) @=> float tab1[];


st.sampSchedule(
    st.write(tab1,
        st.rv(-1,1),
        st.rv(0,
            st.tableCap(tab1))),
    st.rv(1,1000));

fun Stream abstract () {
return 
st.t(
    st.ch([0.001000000000,0.020000000000,0.300000000000,0.000100000000,0.020000000000,0.030000000000]),
    st.fractRandTimer(
        st.ch([0.001000000000,0.020000000000,0.300000000000,0.000100000000,0.020000000000,0.030000000000,0.200000000000,0.500000000000,0.900000000000,1.300000000000])));
}


fun void shred_1() {
StepPanSynth s;

s.init(
    st.indexLin(tab1,
        st.line(
            st.seq([st.s(0),
  st.tableCap(tab1)]),
            st.t(
                st.div(1.0,
                    st.mtof(
                        st.q(
                            st.rv(1,130),7))),abstract())))
,
    st.s(1)
,
    st.hold(
        st.seq(tab1),
        st.t(
            st.seq([1.,1000]),
            st.ch([1.,3,5,7])))
);

day => now;
}
spork ~ shred_1();

<<<"shred id: ",me.id()>>>;
            ShredEvent end;
            "writer_2" @=> end.name;
            ShredEventStack stack;
            stack.push(end);
            end => now;
            