package fr.usmb.m1isc.compilation.simple;

import java.io.FileReader;
import java.io.InputStreamReader;

public class Main {
	public static void main(String[] args) throws Exception {
		SimpleLexer lexer;
		if (args.length > 0)
			lexer = new SimpleLexer(new FileReader(args[0]));
		else
			lexer = new SimpleLexer(new InputStreamReader(System.in));
		parser p = new parser(lexer);
		p.parse();
	}
}
