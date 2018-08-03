my $n = 40;
my $repeat-count = 10000;

sub fib(Numeric $n) {
  return (1, 1, *+* ... *)[$n - 1];
}

my $start = now;
for ^$repeat-count {
  fib($n);
}
my $end = now;
say Int(($end - $start) * 1000);
