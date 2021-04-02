import java_cup.runtime.*;

%%
%class Lexer
%unicode
%cup
%column
//%debug
//%states IN_COMMENT
%{

    StringBuffer string = new StringBuffer();

  private Symbol symbol(int type) {
    return new Symbol(type, yyline, yycolumn);
  }
  private Symbol symbol(int type, Object value) {
    return new Symbol(type, yyline, yycolumn, value);
  }
%}
Whitespace = [\ \n\t\r]+
//\r|\n|\r\n|" "|"\t"

Letter = [a-zA-Z]
Digit = [0-9]
IdChar = {Letter} | {Digit} | "_"
Identifier = [TF] {IdChar}+ | [a-zA-EG-SU-Z] {IdChar}*
Integer = (0|[1-9]{Digit}*)
Float = {Digit}*[.]{Digit}+
Rational = ({Integer}+"_")?{Integer}"/"{Integer}
Character = '[\x00-\x7F]'

Comment = {TraditionalComment} | {EndOfLineComment}
TraditionalComment = "/#" ~"#/"
//assuming above possible
EndOfLineComment = "#"[^\r\n]*[\r|\n|\r\n]?

%state STRING

%%
<YYINITIAL> {

	// Data Types
	"bool"			{ return symbol(sym.BOOL_TYPE);	}
	"int"			{ return symbol(sym.INT_TYPE);	}
	"rat"			{ return symbol(sym.RAT_TYPE);	}
	"float"			{ return symbol(sym.FLOAT_TYPE);}
	"char"			{ return symbol(sym.CHAR_TYPE);	}
 	"str"           { return symbol(sym.STR_TYPE);  }
	"dict"          { return symbol(sym.DICT_TYPE); }
	"seq"			{ return symbol(sym.SEQ_TYPE);	}
	"top"			{ return symbol(sym.ANY_TYPE);	}

}

<YYINITIAL> {

	// Keywords
	"if"			{ return symbol(sym.IF);		}
	"elif"          { return symbol(sym.ELIF);      }
	"else"			{ return symbol(sym.ELSE);		}
	"while"         { return symbol(sym.WHILE);     }
	"break"			{ return symbol(sym.BREAK);		}
	"range"         { return symbol(sym.RANGE);     }
    "for"           { return symbol(sym.FOR);       }
    "of"            { return symbol(sym.OF);        }
	"fdef"			{ return symbol(sym.FDEF);		}
	"tdef"			{ return symbol(sym.TDEF);		}
	"alias"			{ return symbol(sym.ALIAS);		}
	"thread"        { return symbol(sym.THREAD);    }
	"wait"          { return symbol(sym.WAIT);      }
	"read"			{ return symbol(sym.READ);		}
	"print"			{ return symbol(sym.PRINT);		}
	"return"		{ return symbol(sym.RETURN);    }
	"main"			{ return symbol(sym.MAIN);		}

}

<YYINITIAL> {

	// Symbols
	"("				{ return symbol(sym.LPAREN);		}
	")"				{ return symbol(sym.RPAREN);		}
	"["				{ return symbol(sym.LBRACK);		}
	"]"				{ return symbol(sym.RBRACK);		}
	"{"				{ return symbol(sym.LBRACE);		}
	"}"				{ return symbol(sym.RBRACE);		}
	";"				{ return symbol(sym.SEMICOLON);		}
	":"				{ return symbol(sym.COLON);		    }
	">"				{ return symbol(sym.GREATTHAN);	    }
	"<"				{ return symbol(sym.LESSTHAN);		}
	","				{ return symbol(sym.COMMA);		    }
	"."				{ return symbol(sym.DOT);	     	}

}

<YYINITIAL> {

	// Operators
    "!"				{ return symbol(sym.NOT);		    }
	"&&"			{ return symbol(sym.AND);		    }
	"||"			{ return symbol(sym.OR);		    }
	"+"				{ return symbol(sym.PLUS);		    }
	"-"				{ return symbol(sym.MINUS);	     	}
	"*"				{ return symbol(sym.MULTIPLY);		}
	"/"				{ return symbol(sym.DIVIDE);		}
	"^"				{ return symbol(sym.POWER);		    }
	"in"			{ return symbol(sym.IN);		    }
	"len"           { return symbol(sym.LENGTH);        }
	"<="			{ return symbol(sym.LESSTHANEQUAL);	}
	">="            { return symbol(sym.GREATTHANEQUAL);}
	"="				{ return symbol(sym.EQUAL);		    }
	"!="			{ return symbol(sym.NOTEQUAL);	    }
	":="			{ return symbol(sym.ASSIGN);	    }
	"?"             { return symbol(sym.QUESTION);      }

}

<YYINITIAL> {

	// String Literals					}
	"T"				{ return symbol(sym.TRUE);				            			}
	"F"				{ return symbol(sym.FALSE);				            			}
	{Identifier}	{ return symbol(sym.ID, yytext()); 			        			}
	{Float}			{ return symbol(sym.FLOAT, new Double(yytext()));     		    }
	{Rational}		{ return symbol(sym.RAT, yytext());			        			}
	{Integer}		{ return symbol(sym.INT, new Integer(yytext()));				}
	{Character}		{ return symbol(sym.CHAR, new Character(yytext().charAt(1))); 	}
	\"				{ string.setLength(0); yybegin(STRING); 		            	}

}

<YYINITIAL> {

  {Comment}		{ /* do nothing */		}
  {Whitespace}  	{ /* do nothing */              }

}

<STRING>	{
	\"				    	{ yybegin(YYINITIAL); return symbol(sym.STRING, string.toString());}
	[^\n\r\"\\]+			{ string.append(yytext());								       }
	\\t				    	{ string.append('\t');											   }
	\\n				    	{ string.append('\n');											   }
	\\r				    	{ string.append('\r');										   	   }
	\\\"			   	    { string.append('\"');									   		   }
	\\				        { string.append('\\');											   }
}

/* error fallback */
[^]  {
    System.out.println("Error in line "
        + (yyline+1) +": Invalid input '" + yytext()+"'");
    return symbol(sym.ILLEGAL_CHARACTER);
}
