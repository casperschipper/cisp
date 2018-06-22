
cs.sync(0.120000000000);


cs.sync(0.120000000000);


function void superChuckFunc_1() { 
        SuperChuck s;
        
        s.instrument("hihat");
s.addPar("amp",
  st.st(0.030000000000));
s.addPar("freq",
  st.st(1000));
s.addPar("dur",
  st.st(0.010000000000));
s.addPar("pan",
  st.st(-1));


        s.timer(
    st.div(1.0,7.0));
        s.play();
        day => now;
        } spork ~ superChuckFunc_1();

function void superChuckFunc_2() { 
        SuperChuck s;
        
        s.instrument("hihat");
s.addPar("amp",
  st.st(0.030000000000));
s.addPar("freq",
  st.st(1000));
s.addPar("dur",
  st.st(0.010000000000));
s.addPar("pan",
  st.st(1));


        s.timer(
    st.div(1.0,11.0));
        s.play();
        day => now;
        } spork ~ superChuckFunc_2();

<<<"shred id: ",me.id()>>>;
Event end;
(new ShredEventStack).push(end);
end => now;