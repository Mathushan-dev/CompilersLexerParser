tdef person {str name, str surname, int age}; # person definition
tdef family {tdef female {int height, int age} mother, person father, seq<person> children}; # family definition

fdef main() { 

# testing whether custom type accessor work properly

  person m := "aaaaAAA", "bbBB0_i", 40;
  person f := "aaabAAA", "bbBB0_i", 35;
  person c1 := "aaabAAA", "bbBB0_i", 1;
  person c2 := "aaadAAA", "bbBB0_i", 2;
  person c3 := "aaaeAAA", "bbBB0_i", 3;

  str s;

  family fam := m,f,[c1,c2];
  fam.children := fam.children + [c3];

  s := fam.mother.surname;
  s := fam.children[0].name;

  return;
};
