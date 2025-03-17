

fun void shred_1() {
StepSynth s => Safe safe =>dac;



s.init(
    st.seq([-1.,1])
,
    st.s(100)

);




day => now;
}
spork ~ shred_1();

<<<"shred id: ",me.id()>>>;
            ShredEvent end;
            "henke" @=> end.name;
            ShredEventStack stack;
            stack.push(end);
            end => now;
            