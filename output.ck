

fun void shred_1() {
StepSynth s => Safe safe =>dac;



s.init(
    st.indexLin(
        cs.fillf(128,-1,1),
        st.walkList(
            cs.steno("In de slechts 12h kilometer lange rit draaide alles om de slotklim, de Flumserberg. In die klim werden van de vroege vluchters opgeraapt. Bevin, en Luis Mas haakten af toen Tolhoek gas gaf. De voorsprong met hen was al snel groot genoeg, maar vanuit het peloton kwam Egan Bernal ineens snel aanzetten."),
            st.hold(
                st.seq([-1.,1]),
                st.rv(
                    st.line(
                        st.seq([1.,60]),
                        st.rv(0.100000000000,0.500000000000)),
                    st.seq(
  st.line(
      st.seq([1.,160]),
      st.rv(1,5)))))))
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