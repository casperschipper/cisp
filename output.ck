

    cs.fillf(128,0,128) @=> float table1[];

fun Stream a () {
return 
st.line(
    st.seq([0.,128]),
    st.t(
        st.ch([0.100000000000,1,4,7]),
        st.ch([0.500000000000,1.0,2.0,5.0,6.0])));
}


        class Procedure_1 extends Stream {
        st ST; // this is for namespace reasons, st is already used within Stream class.

        fun float next() {
        		
    ST.write(table1,
        ST.count(128),
        ST.sum(
            ST.loop(
                ST.count(128),
                ST.ch([4.,8,6]),
                ST.ch([4.,8,6])),
            ST.line(
                ST.seq([0.,128]),
                ST.ch([2.,5,7]))));
        	}
        }


        Procedure_1 writeCall;



        class Procedure_2 extends Stream {
        st ST; // this is for namespace reasons, st is already used within Stream class.

        fun float next() {
        		
    ST.write(table1,
        ST.rv(0,128),
        ST.rv(0,128));
        	}
        }


        Procedure_2 writeCall2;


st.schedule(
    st.ch([writeCall $ Stream,writeCall2]),
    st.line(
        st.seq([0.100000000000,0.300000000000]),
        st.ch([3.,5,9])));

fun Stream walki () {
return 
st.guardedWalk(0,[st.guardTest(    st.smaller(128),    st.sum(        st.ch(126)))$ Guard,st.guardTest(    st.bigger(0),    st.sub(        st.ch(126))),st.otherwise(    st.hold(        st.ch([1.,1]),        st.st(10)))]);
}
fun Stream mask () {
return 
st.line(
    st.seq([a() $ Stream,a()]),
    st.fractRandTimer(
        st.ch([st.st(0.100000000000),st.st(0.200000000000),
  st.line(
      st.seq([0.100000000000,1.500000000000]),
      st.ch([1.,3,5]))])));
}
fun Stream loopSize () {
return 
st.t(
    st.ch(1),
    st.ch([1.,3,2]));
}
fun Stream loopAmount () {
return 
st.t(
    st.rv(1000,2000),
    st.ch([1.,3,2]));
}
fun Stream loopedWalki () {
return 
st.loop(walki(),loopSize(),loopAmount());
}
fun Stream loopedMask () {
return 
st.loop(mask(),loopSize(),loopAmount());
}
fun Stream indexSelect () {
return 
st.index([loopedWalki() $ Stream,loopedMask()],
    st.t(
        st.ch([1.,1]),
        st.ch([3.,2,1])));
}
fun Stream freq () {
return 
st.t(
    st.index(OSC.table2,
        st.index(table1,indexSelect())),0.200000000000);
}
fun Stream quantizer () {
return 
st.hold(
    st.seq([st.st(4),
  st.seq([0.,5,7,12,7]),st.st(7),st.st(12),
  st.seq([12.,24,7,14]),st.st(1)]),
    st.hold(
        st.seq([30.,100,200]),
        st.seq([2.,30,500,1])));
}
fun Stream mupper () {
return 
st.mtor(
    st.line(
        st.hold(
            st.seq([0.,0]),
            st.ch([2.,3])),
        st.fractRandTimer(
            st.ch([0.010000000000,0.100000000000,0.500000000000,2.0,4.0]))));
}
fun Stream output () {
return 
st.div(44100,
    st.mup(
        st.mtof(
            st.q(freq(),quantizer())),mupper()));
}


fun void shred_1() {
StepSynth s => Safe safe =>dac;



s.init(
    st.mup(
        st.sineseg(output()),1)
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