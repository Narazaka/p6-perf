use Time::HiRes qw/gettimeofday tv_interval/;

my $re = /(a(?:bc)+?)[de]$/;
my $str = "regexp123abcbcd";
my $repeat_count = 10000000;

my $start = [gettimeofday];
for (my $i = 0; $i < $repeat_count; ++$i) {
  $str =~ $re;
}
my $end = [gettimeofday];
print int(tv_interval($start, $end) * 1000), "\n";
