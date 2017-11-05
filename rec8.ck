// chuck this with other shreds to record to file
// example> chuck foo.ck bar.ck rec (see also rec2.ck)

// arguments: rec:<filename>

// get name
<<<"hallo",dac.channels()>>>;

me.arg(0) => string filename;
if( filename.length() == 0 ) "Utrecht2-list" => filename;

// pull samples from the dac
dac.chan(0) => Gain g1 => WvOut c1 => blackhole;
dac.chan(1) => Gain g2 => WvOut c2 => blackhole;
dac.chan(2) => Gain g3 => WvOut c3 => blackhole;
dac.chan(3) => Gain g4 => WvOut c4 => blackhole;
dac.chan(4) => Gain g5 => WvOut c5 => blackhole;
dac.chan(5) => Gain g6 => WvOut c6 => blackhole;
dac.chan(6) => Gain g7 => WvOut c7 => blackhole;
dac.chan(7) => Gain g8 => WvOut c8 => blackhole;


// this is the output file name
filename + "-1.wav" => c1.wavFilename;
filename + "-2.wav" => c2.wavFilename;
filename + "-3.wav" => c3.wavFilename;
filename + "-4.wav" => c4.wavFilename;
filename + "-5.wav" => c5.wavFilename;
filename + "-6.wav" => c6.wavFilename;
filename + "-7.wav" => c7.wavFilename;
filename + "-8.wav" => c8.wavFilename;

<<<"writing to file:", "'" + c1.filename() + "'">>>;
// any gain you want for the output

// infinite time loop...
// ctrl-c will stop it, or modify to desired duration
while( true ) 1::second => now;
