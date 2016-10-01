GEN_SRC := $(shell echo build/*.cs)
all:
	antlr4 -Dlanguage=CSharp -package BRAB.GEO -o build -visitor -no-listener Geo.g4
	mcs -nowarn:3021 /reference:Antlr4.Runtime.dll -target:library GeoParser.cs $(GEN_SRC)


clean:
	rm -rf build parser
