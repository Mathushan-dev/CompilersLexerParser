fdef int fibonacci( pos: int ) { 
	if (pos = -1) {
		return 0;
	}
	if (pos = 0) {
		return 1;
	}
	return fibonacci(pos-1) + fibonacci(pos-2);
};

fdef foo () {
   print "I am a function after main.";
};

fdef main() {
	fibonacci( 13 );
	return;
};

