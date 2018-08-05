using System;
using System.Linq;
using System.Diagnostics;

class Program {
    const string Chunk = "regexp123abcbcd";
    const int RepeatCount = 10000;
    const int Size = 1000;

    static void Join() {
        string.Concat(Enumerable.Repeat(Chunk, Size));
    }

    static void Main() {
        var sw = new Stopwatch();
        sw.Start();
        for (var i = 0; i < RepeatCount; ++i) Join();
        sw.Stop();
        Console.WriteLine(sw.ElapsedMilliseconds);
    }
}
