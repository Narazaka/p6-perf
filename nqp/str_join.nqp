my $chunk := 'regexp123abcbcd';
my $repeat-count := 10000;
my $size := 1000;

sub str_join() {
  my $str := "";
  my $i := 0;
  while $i < $size {
    ++$i;
    $str := $str ~ $chunk;
  }
}

my $start := nqp::time();
my $i := 0;
while $i < $repeat-count {
  ++$i;
  str_join();
}
my $end := nqp::time();
say(nqp::mul_n(nqp::sub_n($end, $start), 0.000000001) + 0);
