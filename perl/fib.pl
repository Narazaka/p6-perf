use Time::HiRes qw/gettimeofday tv_interval/;

my $n = 30;
my $repeat_count = 10;

sub fib {
  my $n = @_[0];
  return $n < 2 ? $n : fib($n - 2) + fib($n - 1);
}

my $start = [gettimeofday];
for (my $i = 0; $i < $repeat_count; ++$i) {
  fib($n);
}
my $end = [gettimeofday];
print int(tv_interval($start, $end) * 1000), "\n";
