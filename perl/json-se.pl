use Time::HiRes qw/gettimeofday tv_interval/;
use JSON::XS qw/encode_json/;

my $obj = +{
  foo1 => "bar",
  foo2 => 2,
  foo3 => [1, 2, 3],
  foo4 => undef,
};
my $repeat_count = 10000000;

my $start = [gettimeofday];
for (my $i = 0; $i < $repeat_count; ++$i) {
  encode_json $obj;
}
my $end = [gettimeofday];
print int(tv_interval($start, $end) * 1000), "\n";
