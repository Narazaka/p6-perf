my $x := 12;
my $y := 6;
my $z := 0;
my $repeat-count := 5;

sub tarai($x, $y, $z) {
  return $x <= $y ??
    $y !!
    tarai(
      tarai($x - 1, $y, $z),
      tarai($y - 1, $z, $x),
      tarai($z - 1, $x, $y),
    );
}

my $start := nqp::time_n();
my $i := 0;
while $i < $repeat-count {
  ++$i;
  tarai($x, $y, $z);
}
my $end := nqp::time_n();
say(nqp::mul_n(nqp::sub_n($end, $start), 1000) + 0);
