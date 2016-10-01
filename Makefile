GEN_SRC := $(shell echo build/*.cs)
all:
	antlr4 -Dlanguage=CSharp -package BRAB.GEO -o build -visitor -no-listener Geo.g4
	mcs -nowarn:3021 /reference:Antlr4.Runtime.dll parser.cs $(GEN_SRC) -out:parser


clean:
	rm -rf build parser
