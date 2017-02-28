fun Stream casper () {
return 
st.line(
    st.seq([1,100]),
    st.rv(1,4));
}

function void superChuckFunc_1() { 
    SuperChuck sc;
    sc.instrument("saw");
    sc.timer(
    st.st(0.12));
    sc.freq(
    st.loop(
        st.weightStream([100.0,200,300,400],[casper() $ Stream,casper(),casper(),casper()]),
        st.st(4),
        st.st(4)));
    sc.duration(
    st.line(
        st.rv(0.1,1.0),
        st.rv(1,10)));
    sc.amp(st.st(0.1));
    sc.pan(st.st(0.0));
    sc.start();
    day => now;
}
spork ~ superChuckFunc_1();

day => now;