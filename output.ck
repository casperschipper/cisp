fun Stream pitch () {
return 
st.hold(
    st.seq([440,110,220,330,550,1100,222]),
    st.ch([1,2]));
}

function void superChuckFunc_1() { 
        SuperChuck sc;
        sc.instrument("saw");
sc.addPar("freq",
  st.seq([pitch() $ Stream,pitch()]));

        sc.timer(
    st.st(0.1));
        sc.play();
        day => now;
        } spork ~ superChuckFunc_1();

day => now;