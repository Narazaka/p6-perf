use Time::HiRes qw/gettimeofday tv_interval/;
use JSON::XS qw/decode_json/;

my $json = <<'EOM';
{
  "foo1": "bar",
  "foo2": 2,
  "foo3": [1, 2, 3],
  "foo4": null
}
EOM
my $repeat_count = 1000000;

my $start = [gettimeofday];
for (my $i = 0; $i < $repeat_count; ++$i) {
  decode_json $json;
}
my $end = [gettimeofday];
print int(tv_interval($start, $end) * 1000), "\n";
