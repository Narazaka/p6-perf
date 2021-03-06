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

my $start := nqp::time_n();
my $i := 0;
while $i < $repeat-count {
  ++$i;
  str_join();
}
my $end := nqp::time_n();
say(nqp::mul_n(nqp::sub_n($end, $start), 1000) + 0);
