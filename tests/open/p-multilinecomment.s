fdef sum(int i, int j) {
  return i + j;
};

/#
fdef float mult(i:x L, j:float H) {
  return i * j;
};
#/

fdef main() {

  bool b := F;
  int s1 := sum(-10,20);
  float s2 := sum(10.0,-20.0);
  
  if (s1 < s2 || s1 = s2) {
     b  :=  30 <= s1 + s2 / (s1 + s2);
  }
  else { 
     print b;
     /# do something else #/
  }

  return;
};
