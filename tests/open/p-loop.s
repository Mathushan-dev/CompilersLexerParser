str s1 := "Alice in Wonderland";
str s2 := "Gilgamesh";
str s3 := "One Thousand and One Nights";

fdef main() {
    seq<str> books :=[s1,s2,s3];
    str key := "ic";  
    bool found := F;
    int i := 0;
    str tmp;

    while {
        if (i < len(books)) {
            break;
        }
        tmp := books[i];
        if (key = tmp) { found := T; }
        i := i + 1;
    }
};
