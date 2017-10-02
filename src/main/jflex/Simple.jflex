/* --------------------------Section de Code Utilisateur---------------------*/
package fr.usmb.m1isc.compilation.simple;
import java_cup.runtime.Symbol;

%%

/* -----------------Section des Declarations et Options----------------------*/
// nom de la class a generer
%class SimpleLexer
%unicode
%line	// numerotation des lignes
%column	// numerotation caracteres par ligne


%cup	// utilisation prevue avec CUP

// code a ajouter dans la classe produite
%{

%}

/* definitions regulieres */
il		= 	"Il"|"il"
elle	= 	"Elle"|"elle" 
pronom 	= 	{il}|{elle}
verbe 	= 	"est"|"boit"
adj		= 	"vite"|"beau"|"belle"|"bien"|"chaud"
sep		= 	\s
point	=	[.?!;]

%% 
/* ------------------------Section des Regles Lexicales----------------------*/

/* regles */
{sep}+			{ /*pas d'action*/ }
{pronom}		{ return new Symbol(sym.PRONOM, yyline, yycolumn); }
{verbe}			{ return new Symbol(sym.VERBE, yyline, yycolumn); }
{adj}			{ return new Symbol(sym.ADJECTIF, yyline, yycolumn); }
{point}			{ return new Symbol(sym.POINT, yyline, yycolumn); }
.				{ return new Symbol(sym.ERROR, yyline, yycolumn); }
