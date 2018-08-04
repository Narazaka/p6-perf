use 5.20.0;
use utf8;
use open ":encoding(utf8)";
use IO::Dir;
use IO::File;
use File::Slurp qw/read_file/;
use File::Spec::Functions qw/catfile/;
use JSON::XS;
require "./config.pl";
our %version;

my $results_dir = "results";
my $summarize_file = "results.json";

my $obj = {
    version => {},
    result => {},
};

my $dh = new IO::Dir($results_dir) or die "cannot open dir $results_dir";
while (my $category = $dh->read) {
    next if $category =~ /^\./;
    my $category_dir = catfile $results_dir, $category;
    my $dh2 = new IO::Dir($category_dir) or die "cannot open dir $category_dir";
    while (my $language = $dh2->read) {
        next if $language =~ /^\./;
        my $language_file = catfile $category_dir, $language;
        my $time = int read_file $language_file, binmode => ":utf8";
        $obj->{result}->{$category} = {} unless $obj->{result}->{$category};
        $obj->{result}->{$category}->{$language} = $time;
    }
}

for my $language (keys %version) {
    $obj->{version}->{$language} = $version{$language}->();
}

my $fh = new IO::File($summarize_file, "w") or die $!;
print $fh JSON::XS->new->utf8->pretty->encode($obj);
$fh->close;
