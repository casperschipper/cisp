
 st.define("casper",10);

 

fun void shred_1() {
StepSynth s => Safe safe =>dac;



s.init(
     st.wr("casper",
        st.apply(
            st.rd("casper") ,[st.guardTest(    st.bigger(10),    st.mup(2))$ Guard,st.guardTest(    st.bigger(1000),    st.st(200)),st.guard(    st.rv(-10,10))])) 
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