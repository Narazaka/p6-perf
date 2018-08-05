my $x = 12;
my $y = 6;
my $z = 0;
my $repeat-count = 5;

sub tarai(Numeric $x, Numeric $y, Numeric $z) {
  return $x <= $y ??
    $y !!
    tarai(
      tarai($x - 1, $y, $z),
      tarai($y - 1, $z, $x),
      tarai($z - 1, $x, $y),
    );
}

my $start = now;
for ^$repeat-count {
  tarai($x, $y, $z);
}
my $end = now;
say Int(($end - $start) * 1000);
