use Time::HiRes qw/gettimeofday tv_interval/;

my $x = 12;
my $y = 6;
my $z = 0;
my $repeat_count = 10;

sub tarai {
  my ($x, $y, $z) = @_;
  return $x <= $y ?
    $y :
    tarai(
      tarai($x - 1, $y, $z),
      tarai($y - 1, $z, $x),
      tarai($z - 1, $x, $y),
    );
}

my $start = [gettimeofday];
for (my $i = 0; $i < $repeat_count; ++$i) {
  tarai($x, $y, $z);
}
my $end = [gettimeofday];
print int(tv_interval($start, $end) * 1000), "\n";
