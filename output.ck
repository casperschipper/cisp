fun Stream foo () {
return 
st.mup(
    st.seq([100,200,300,400,500]),
    st.floor(
        st.ch([1,2,4,8])));
}

function void superChuckFunc_1() { 
    SuperChuck sc;
    sc.instrument("saw");
    sc.timer(0.12);
    sc.freq(foo());
    sc.duration(0.5);
    sc.amp(0.1);
    sc.start();
    day => now;
}
spork ~ superChuckFunc_1();

function void superChuckFunc_2() { 
    SuperChuck sc;
    sc.instrument("saw");
    sc.timer(0.12);
    sc.freq(foo());
    sc.duration(0.5);
    sc.amp(0.1);
    sc.start();
    day => now;
}
spork ~ superChuckFunc_2();

function void superChuckFunc_3() { 
    SuperChuck sc;
    sc.instrument("saw");
    sc.timer(0.12);
    sc.freq(foo());
    sc.duration(0.5);
    sc.amp(0.1);
    sc.start();
    day => now;
}
spork ~ superChuckFunc_3();

day => now;