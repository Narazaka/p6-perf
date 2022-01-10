my $re := /a[bc]+?<[de]>$/;
my $str := "regexp123abcbcd";
my $repeat-count := 1000000;

my $start := nqp::time();
my $i := 0;
while $i < $repeat-count {
  ++$i;
  $str ~~ $re;
}
my $end := nqp::time();
say(nqp::mul_n(nqp::sub_n($end, $start), 0.000001) + 0);
