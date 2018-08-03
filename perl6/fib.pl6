my $n = 40;
my $repeat-count = 10;

sub fib(Numeric $n) {
  return $n < 2 ?? $n !! fib($n - 2) + fib($n - 1);
}

my $start = now;
for ^$repeat-count {
  fib($n);
}
my $end = now;
say Int(($end - $start) * 1000);
