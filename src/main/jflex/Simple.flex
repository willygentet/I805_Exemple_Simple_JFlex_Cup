/* --------------------------Section de Code Utilisateur---------------------*/
package fr.usmb.m1isc.compilation.simple;
import java_cup.runtime.Symbol;
import java.util.LinkedList;

%%

/* -----------------Section des Declarations et Options----------------------*/
// nom de la class a generer
%class SimpleLexer
%unicode
%line   // numerotation des lignes
%column // numerotation caracteres par ligne

// utilisation avec CUP
// nom de la classe generee par CUP qui contient les symboles terminaux
%cupsym SimpleParserSym
// generation analyser lexical pour CUP
%cup

// code a ajouter dans la classe produite
%{
    private LinkedList<Object> pileNum = new LinkedList<>();
    private LinkedList<Object> pileOp = new LinkedList<>();
%}

/* definitions regulieres */
/*
minus = "-"
div = "/"
mult = "*"
op = {plus}|{minus}|{div}|{mult}*/
lpar = "("
rpar = ")"
number = [0-9]+
plus = "+"
sep = \s
end = ";"


%% 
/* ------------------------Section des Regles Lexicales----------------------*/

/* regles */
{sep}+          { /* pas d'action */ }
{number}        { return new Symbol(SimpleParserSym.NUMBER, yyline, yycolumn, new Integer(yytext())); }
{plus}          { return new Symbol(SimpleParserSym.PLUS, yyline, yycolumn); }
{lpar}          { return new Symbol(SimpleParserSym.LPAR, yyline, yycolumn); }
{rpar}          { return new Symbol(SimpleParserSym.RPAR, yyline, yycolumn); }
{end}           { return new Symbol(SimpleParserSym.END); }
.               { return new Symbol(SimpleParserSym.ERROR, yyline, yycolumn); }

