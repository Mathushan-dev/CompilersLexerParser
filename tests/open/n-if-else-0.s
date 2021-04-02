str s1 := "Alice in Wonderland";
str s2 := "Gilgamesh";
str s3 := "One Thousand and One Nights";

fdef main() {
  str key: := "ic";  
  seq<str> books := [s1,s2,s3];

  str c := books[1][3:4];
  char d := books[2][1];
  str tmp;

  bool found := F;
  int i := 0;

  while { 
    if (i < len(books)) { 
      break; 
    }
    tmp := books[i];
    if (key = tmp) {
      found := T;
    }
    else {
      i := i + 1;
    }
    else { # Stray else
      i := i - 1;
    }
  }
};
