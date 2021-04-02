fdef main() {
	tdef person { str name, str surname, int age };
	tdef family { person mother, person father, seq<person> children };
	return;
};
