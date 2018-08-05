using System;
using System.Diagnostics;

class Program {
    const int N = 30;
    const int RepeatCount = 10;

    static int Fib(int n) => n < 2 ? n : Fib(n - 2) + Fib(n - 1);

    static void Main() {
        var sw = new Stopwatch();
        sw.Start();
        for (var i = 0; i < RepeatCount; ++i) Fib(N);
        sw.Stop();
        Console.WriteLine(sw.ElapsedMilliseconds);
    }
}
