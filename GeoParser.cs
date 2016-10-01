using System;
using System.Collections.Generic;

using Antlr4.Runtime;
using Antlr4.Runtime.Tree;

namespace BRAB.GEO
{

public class Point
{
    public string name;
    public string north;
    public string east;
    public string height;

    public Point(string name, string north, string east, string height)
    {
        this.name = name;
        this.north = north;
        this.east = east;
        this.height = height;
    }
}

class PointsVisitor : GeoBaseVisitor<String>
{
    public List<Point> points = new List<Point>();

    public override String VisitName(GeoParser.NameContext context)
    {
        /* slice off "" from name */
        String name = context.STRING().GetText();
        return name.Substring(1, name.Length-2);
    }

    public override String VisitPoint(GeoParser.PointContext context)
    {
        /* stuff all encountered points in the the object global list */
        var name = Visit(context.name());
        var north = context.north().NUMBER().GetText();
        var east = context.east().NUMBER().GetText();
        var height = context.height().NUMBER().GetText();

        points.Add(new Point(name, north, east, height));

        return null;
    }
}

public static class GeoFileParser
{
    public static List<Point> Parse(string filepath)
    {
        var stream = new AntlrFileStream(filepath);

        var lexer = new GeoLexer(stream);
        var parser = new GeoParser(new CommonTokenStream(lexer));
        IParseTree tree = parser.geo();

        var visitor = new PointsVisitor();
        visitor.Visit(tree);

        return visitor.points;
    }
}

}
