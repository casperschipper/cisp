PulseFBSynth synth => dac;

class M extends st {
    synth.init(
    seq(cs.fillf(32,-1,1)).max(t(rv(2,32),rv(0,9))),
    t(
        ch(loop(exprv(1,500,4),st(4),st(4)),rv(1000,40000)),
        loop( 
            fractRandTimer(div(1.0,rf(-40,60))), st(4), st(4))));
    synth.pan(st(1.0));
    synth.fb(t(seq([-0.5,0.5,0.8,-0.9]),st(5)));
    synth.freq(loop(rf(0,120),st(4),st(4)));
    synth.play();
}

M m;

hour => now;