fdef dict<str,int> make_dict() {
   return ("a":1, "b":-2, "c":3, "d":-4, "e":5);
} ;

fdef main() {

   dict<int,str> d1 := (1:"a", 2:"b", 3:"c", 4:"d", 5:"e");
   dict<int,str> d2 := (1:"a", 2:"b", 3:"c", 4:"d", 5:"e");
   dict<top,char> d3 := (1:'a', 2:'b', 3.0:'c', [1,2]:'d'); 
   dict<char,top> d4 := ('a':(1:1,2:2,3:3), 'b':("x":4,"y":5,"z":6)); # dict of dict

   d1[1] := "f";
   d2[5] := d1[4];

   if (len(d3) < len(make_dict()) && 5 ? d4) {
      print "Hello world!";
   }
};
