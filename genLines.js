function bang() {
	var a = rv(1,10000);
	var b = a + rv (1,100);
	value = "" + a + ' , ' + b + ' '+  rv(1,5000);
	outlet(0,value);
}

function rv(a,b) {
	return Math.random() * Math.abs(b-a) + Math.min(a,b);
}