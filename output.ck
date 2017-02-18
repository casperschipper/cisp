fun Stream rep () {
return 
st.seq([
    st.ch([1,2]),st.st(5),st.st(4),st.st(9),st.st(1),st.st(2),st.st(3)]);
}
fun Stream rep2 () {
return 
st.seq([
    st.ch([1,2]),st.st(5),st.st(4),st.st(9),st.st(1),st.st(2)]);
}
fun Stream rep3 () {
return 
st.seq([
    st.ch([1,2]),st.st(5),st.st(4),st.st(9),st.st(1),st.st(3)]);
}
fun Stream panLine () {
return 
st.line(
    st.seq([-1,1]),
    st.ch([1,2,4,8]));
}
fun Stream foo () {
return 
st.mtof(
    st.sum(
        st.seq([
            st.hold(
                st.seq([0,2,-2,4,7]),rep()) $ Stream,
            st.hold(
                st.seq([4,7,9,12,5]),rep2()),
            st.hold(
                st.seq([7,4,2,9,5]),rep3())]),60));
}

function void superChuckFunc_1() { 
    SuperChuck sc;
    sc.instrument("saw");
    sc.timer(0.1);
    sc.freq(foo());
    sc.duration(0.2);
    sc.amp(0.1);
    sc.pan(panLine());
    sc.start();
    day => now;
}
spork ~ superChuckFunc_1();

function void superChuckFunc_2() { 
    SuperChuck sc;
    sc.instrument("saw");
    sc.timer(0.1);
    sc.freq(foo());
    sc.duration(0.2);
    sc.amp(0.1);
    sc.pan(panLine());
    sc.start();
    day => now;
}
spork ~ superChuckFunc_2();

function void superChuckFunc_3() { 
    SuperChuck sc;
    sc.instrument("saw");
    sc.timer(0.1);
    sc.freq(foo());
    sc.duration(0.2);
    sc.amp(0.1);
    sc.pan(panLine());
    sc.start();
    day => now;
}
spork ~ superChuckFunc_3();

function void superChuckFunc_4() { 
    SuperChuck sc;
    sc.instrument("saw");
    sc.timer(0.1);
    sc.freq(foo());
    sc.duration(0.2);
    sc.amp(0.1);
    sc.pan(panLine());
    sc.start();
    day => now;
}
spork ~ superChuckFunc_4();

function void superChuckFunc_5() { 
    SuperChuck sc;
    sc.instrument("saw");
    sc.timer(0.1);
    sc.freq(foo());
    sc.duration(0.2);
    sc.amp(0.1);
    sc.pan(panLine());
    sc.start();
    day => now;
}
spork ~ superChuckFunc_5();

function void superChuckFunc_6() { 
    SuperChuck sc;
    sc.instrument("saw");
    sc.timer(0.1);
    sc.freq(foo());
    sc.duration(0.2);
    sc.amp(0.1);
    sc.pan(panLine());
    sc.start();
    day => now;
}
spork ~ superChuckFunc_6();

day => now;