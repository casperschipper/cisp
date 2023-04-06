function makeSchmittIter(input,low,high) {
	var state = 0; // 0 is down 1 is up
	return {
		next : function ( ) {
			current = input.next()
			if (current.done) {
				return { value: null, done: true };
			}
			if (state) { // up
				if ( current.value < low ) {
					state = 0;
				}
			} else {
				//state is down;
				if ( current.value > high ) {
					state = 1;
				}
			}
			return { value : state, done: false };
		}
	}
}

function makeZeroToOneTest( input ) {
	// when value changes from 0 to 1, output a 1 (trigger).
	var previous = 0;
	return {
		next : function ( ) {
			var current = input.next();
			if (current.done) {
				return { value:null,done:true };
			}
			if ( previous <= 0 && current.value > 0) {
				previous = current.value;
				return { value:1,done:false };
			}
			previous = current.value;
			return { value :0,done:false };
		}
	};
}

function makeTimer( input ) { // timer returns a value 
	var sampCount = 0;
	return {
		next : function ( ) {
			var step = input.next();
			var current = step.value;
			
			while( current <= 0 ) {
				sampCount = sampCount + 1;
				step = input.next();
 				current = step.value;
				if (step.done) {
					return { value:null, done:true };
				}
			}
			return { value:sampCount,done:false };
		}
	};
}
	
function makeBufferIter( bufferName ) {
	var buf = new Buffer(bufferName);
	var index = 0;
	var numberOfSamps = buf.framecount();
	return {
		next : function ( ) {
			if (index > numberOfSamps) {
				return { value:null, done:true };
			} 
			var current = buf.peek( 1, index, 1 );
			index = index + 1;
			return { value:current, done:false };
		}
	}
}

var bufIter, schmitt, timer, test;

function setBuf(argIn,argOut,threshold) {
	bufIter = makeBufferIter(argIn);
	schmitt = makeSchmittIter(bufIter,-1*threshold,threshold);
	test = makeZeroToOneTest(schmitt);
    timer = makeTimer( test );
	output = new Buffer(argOut);
	run();
}
	

function run() {
	var val = timer.next();
	index = 0;
	while(!val.done) {
		output.poke(1, index,  val.value );
		index = index + 1;
		val = timer.next();
	}
	post("done");	
}