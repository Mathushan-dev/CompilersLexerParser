fdef seq<int> upto (int lim, int step) {
  return [x for x of range(0, lim, step)];
};

fdef main() {
	print upto( 13 );
};
