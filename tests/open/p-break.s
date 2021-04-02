fdef main() {
	seq<int> a := [1, 2, 3]; 
	seq<int> b := [4, 5, 6]; 
	int i := 0;
	int j := 0;
	while {
		if (2 < i) {
			break; 
		}
		while {
			if (2 < j) {
				break; # break to the outer loop 
			}
			if (b[j] < a[i]) {
				break 2; # break out of two loops
			}
			j := j + 1;
		}
		i := i + 1;
		j := 0;
	}
};
