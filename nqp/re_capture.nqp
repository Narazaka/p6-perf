
my $re := /(a[bc]+?)<[de]>$/;
my $str := "regexp123abcbcd";
my $repeat-count := 1000000;

my $start := nqp::time_n();
my $i := 0;
while $i < $repeat-count {
  ++$i;
  $str ~~ $re;
}
my $end := nqp::time_n();
say(nqp::mul_n(nqp::sub_n($end, $start), 1000) + 0);
