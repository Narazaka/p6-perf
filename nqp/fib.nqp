my $n := 30;
my $repeat-count := 10;

sub fib($n) {
  return $n < 2 ?? $n !! fib($n - 2) + fib($n - 1);
}

my $start := nqp::time_n();
my $i := 0;
while $i < $repeat-count {
  ++$i;
  fib($n);
}
my $end := nqp::time_n();
say(nqp::mul_n(nqp::sub_n($end, $start), 1000) + 0);
