using System;
using System.Text;
using System.Diagnostics;

class Program {
    const string Chunk = "regexp123abcbcd";
    const int RepeatCount = 10000;
    const int Size = 1000;

    static void Join() {
        var sb = new StringBuilder();
        for (var i = 0; i < Size; ++i) sb.Append(Chunk);
        sb.ToString();
    }

    static void Main() {
        var sw = new Stopwatch();
        sw.Start();
        for (var i = 0; i < RepeatCount; ++i) Join();
        sw.Stop();
        Console.WriteLine(sw.ElapsedMilliseconds);
    }
}
