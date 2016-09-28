using System;
using Antlr4.Runtime;
using Antlr4.Runtime.Tree;

public static class parser
{
    static void parse(string filepath)
    {
        var stream = new AntlrFileStream(filepath);

        var lexer = new GeoLexer(stream);
        var parser = new GeoParser(new CommonTokenStream(lexer));
        IParseTree tree = parser.geo();

        Console.WriteLine("mepp" + tree.ToStringTree(parser));

//        var visitor = new MyVisitor();
//        Console.WriteLine(visitor.Visit(tree));

    }
    public static void Main(string[] args)
    {
        if (args.Length < 1)
        {
            Console.WriteLine("no input file specified");
            return;
        }

	parse(args[0]);
    }
}
