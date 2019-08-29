use 5.20.0;
use utf8;
use IO::Dir;
use IO::All;
use File::Spec::Functions qw/catfile/;
use Time::Piece;
use JSON::XS;

my $base_dir = $ARGV[0];
my $result_summaries_dir_base = $ARGV[1];
my $result_summaries_dir = catfile $base_dir, $result_summaries_dir_base;
my $html_file = catfile $base_dir, $ARGV[2];
my $summarize_file = "results.json";
my $html_template_file = "index.html";

my $results_info = [];

my $dh = new IO::Dir($result_summaries_dir);
while (my $result_filename = $dh->read) {
    next if $result_filename =~ /^\./;
    my $time = Time::Piece->strptime($result_filename, "%Y-%m-%dT%H-%M-%S.json");
    my $info = {file => "$result_summaries_dir_base/$result_filename", time => $time->epoch};
    push @$results_info, $info;
}
@$results_info = sort {$a->{time} <=> $b->{time}} @$results_info;

my $js_str = "const resultsInfo = " . JSON::XS->new->utf8->encode($results_info) . ";";

my $template = io($html_template_file)->utf8->all;
$template =~ s@const resultsInfo = \[\];@$js_str@;
my $fh = new IO::File($html_file, ">:encoding(utf8)");
print $fh $template;
$fh->close;
