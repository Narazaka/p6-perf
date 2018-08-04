use 5.20.0;
use utf8;
use File::Spec::Functions qw/catfile/;
use Time::Piece;

my $dir = $ARGV[0];
my $summarize_file = "results.json";
rename $summarize_file, catfile $dir, gmtime->strftime("%Y-%m-%dT%H-%M-%S.json");
