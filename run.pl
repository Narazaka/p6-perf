use 5.20.0;
use IO::Dir;
use File::Spec::Functions qw/catfile/;

my @languages = qw(
    javascript
    ruby
    perl
    perl6
);

@languages = @ARGV if @ARGV;

my %runtime = (
    perl6 => "perl6",
    perl => "perl",
    javascript => "node",
    ruby => "ruby",
);

my $results_dir = "results";
mkdir $results_dir unless -d $results_dir;

for my $language (@languages) {
    my $dh = new IO::Dir($language) or die "cannot open dir $language";
    while (my $filename = $dh->read) {
        next if $filename =~ /^\./;
        my $filepath = catfile $language, $filename;
        my ($category) = $filename =~ /^(.+)\.[^.]+$/;
        my $result_dir = catfile $results_dir, $category;
        my $result_path = catfile $result_dir, $language;
        mkdir $result_dir unless -d $result_dir;
        my $cmd = "$runtime{$language} $filepath tee $result_path";
        say $cmd;
        system $cmd;
    }
}
