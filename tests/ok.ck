class M extends st {
    seq( [
    seq([11,12,13],true), latch( rv(100,103), st(3) ),
    seq([101,202])
    ]).test();
}