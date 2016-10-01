using System;
using BRAB.GEO;

public class ExampleParser
{
    public static void Main(string[] args)
    {
        if (args.Length < 1)
        {
            Console.WriteLine("no input file specified");
            return;
        }

        var fileName = args[0];
        var points = GeoFileParser.Parse(fileName);
        Console.WriteLine("parsed '{0}', contains {1} points:",
                          fileName, points.Count);
        foreach (var point in points)
        {
            Console.Write("'{0}' ", point.name);
        }
        Console.WriteLine();
    }
}
