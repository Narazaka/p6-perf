use Time::HiRes qw/gettimeofday tv_interval/;

my $chunk = "regexp123abcbcd";
my $repeat_count = 10000;
my $size = 1000;

sub strjoin {
  $chunk x $size;
}

my $start = [gettimeofday];
for (my $i = 0; $i < $repeat_count; ++$i) {
  strjoin;
}
my $end = [gettimeofday];
print int(tv_interval($start, $end) * 1000), "\n";
