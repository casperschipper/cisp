
 st.define("casper",0.100000000000);

 

fun void shred_1() {
StepSynth s => Safe safe =>dac;



s.init(
     st.wr("casper",
        st.apply(
            st.rd("casper") ,[st.guardTestValue(    st.smaller(-1),    st.st(0.100000000000))$ Guard,st.guardTestValue(    st.bigger(1),    st.st(0.100000000000)),st.guardTestValue(    st.smaller(0.000001000000),    st.st(0.100000000000)),st.guard(    st.mup(        st.t(            st.ch([0.500000000000,2.0,0.250000000000,0.666700000000,1.500000000000]),            st.ch([0.100000000000,0.050000000000]))))])) 
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