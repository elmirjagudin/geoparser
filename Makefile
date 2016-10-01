GEN_SRC := $(shell echo build/*.cs)
all:
	antlr4 -Dlanguage=CSharp -package BRAB.GEO -o build -visitor -no-listener Geo.g4
	mcs -nowarn:3021 /reference:Antlr4.Runtime.dll -target:library GeoParser.cs $(GEN_SRC)

example: example.cs
	mcs /reference:GeoParser.dll example.cs -out:example

clean:
	rm -rf build GeoParser.dll example
