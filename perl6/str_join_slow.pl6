my $chunk = "regexp123abcbcd";
my $repeat-count = 10000;
my $size = 1000;

sub join() {
  my @chunks[$size];
  for ^$size -> $i {
    @chunks[$i] = $chunk;
  }
  @chunks.join("");
}

my $start = now;
for ^$repeat-count {
 join;
}
my $end = now;
say Int(($end - $start) * 1000);
