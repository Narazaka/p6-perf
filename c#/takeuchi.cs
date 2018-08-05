using System;
using System.Diagnostics;

class Program {
    const int X = 12;
    const int Y = 6;
    const int Z = 0;
    const int RepeatCount = 10;

    static int Tarai(int x, int y, int z) =>
        x <= y ?
        y :
        Tarai(
            Tarai(x - 1, y, z),
            Tarai(y - 1, z, x),
            Tarai(z - 1, x, y)
        );

    static void Main() {
        var sw = new Stopwatch();
        sw.Start();
        for (var i = 0; i < RepeatCount; ++i) Tarai(X, Y, Z);
        sw.Stop();
        Console.WriteLine(sw.ElapsedMilliseconds);
    }
}
