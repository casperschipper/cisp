
function void superChuckFunc_1() { 
    SuperChuck sc;
    sc.instrument("saw");
    sc.timer(0.25);
    sc.freq(440);
    sc.duration(0.4);
    sc.amp(st.st(0.1));
    sc.start();
    day => now;
}
spork ~ superChuckFunc_1();

day => now;