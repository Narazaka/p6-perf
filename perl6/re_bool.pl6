my $re = /a[bc]+?<[de]>$/;
my $str = "regexp123abcbcd";
my $repeat-count = 1000000;

my $start = now;
for ^$repeat-count {
  $str ~~ $re;
}
my $end = now;
say Int(($end - $start) * 1000);
