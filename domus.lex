import java_cup.runtime.Symbol;

%%
%unicode
%cup
%line
%column

comments = "//"[.]+
types_appareils = "eclairage" | "volet" | "alarme" | "fenetre" | "chauffage" | "cafetiere" | "hifi"
types_interface = "interrupteur" | "mobile" | "telecommande"
variable = [a-z]+[0-9]*

%%
"</"			{ return new Symbol(sym.END_TAG); }
"<"			{ return new Symbol(sym.LOWER); }
">"			{ return new Symbol(sym.GREATER); }
"."			{ return new Symbol(sym.POINT); }
","			{ return new Symbol(sym.COMMA); }
"("			{ return new Symbol(sym.OPEN_BRACKET); }
")"			{ return new Symbol(sym.CLOSE_BRACKET); }
"PROGRAMME_DOMUS"	{ return new Symbol(sym.PROGRAM_DOMUS); }
"DECLARATION_APPAREILS"	{ return new Symbol(sym.DECLARATION_APPAREILS); }
"DECLARATION_INTERFACES"	{ return new Symbol(sym.DECLARATION_INTERFACES); }
"DECLARATION_SCENARII"	{ return new Symbol(sym.DECLARATION_SCENARII); }
"DECLARATION_COMMANDES" { return new Symbol(sym.DECLARATION_COMMANDES); }
{types_appareils}	{ return new Symbol(sym.TYPE_APPAREIL, new String(yytext())); }
{types_interface}	{ return new Symbol(sym.TYPE_INTERFACE, new String(yytext())); }
"autre_appareil"	{ return new Symbol(sym.OTHER_APPAREIL); }
{variable}		{ return new Symbol(sym.VARIABLE, new String(yytext())); }
{comments}		{  }
\n {}
. {}
