fdef int foo(int pos) { 
	if (pos = -1) {
		return 0;
	}
	else { 
		return 1;
	}
	return add( foo( pos-1 ), foo( pos-2 ) );
};

fdef int add (int x, int y) {
	return x + y;
};

fdef main() {
	print foo( 13 );
	return;
};

