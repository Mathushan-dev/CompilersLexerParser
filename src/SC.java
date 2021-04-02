import java.io.FileReader;
import java.io.FileNotFoundException;

import java_cup.runtime.*;

class SC {
	public static void main(String[] args) {
		Lexer lexer;
		try {
			lexer = new Lexer(new FileReader(args[0]));
			try {
				Parser parser = new Parser(lexer);
				Symbol result = parser.parse();
				if (!parser.syntaxErrors) {
					System.out.println("Parsing successful.");
				}
			} catch (Exception e) {
				// e.printStackTrace();
			}
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		}
	}
}
