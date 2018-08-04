use 5.20.0;
use IO::Dir;
use File::Spec::Functions qw/catfile/;
require "./config.pl";
our @languages;
our %compiler;
our %runtime;

@languages = @ARGV if @ARGV;

my $results_dir = "results";
mkdir $results_dir unless -d $results_dir;

for my $language (@languages) {
    my $dh = new IO::Dir($language) or die "cannot open dir $language";
    while (my $filename = $dh->read) {
        next if $filename =~ /^\.|\.exe$/;
        my $filepath = catfile $language, $filename;
        my ($category) = $filename =~ /^(.+)\.[^.]+$/;
        my $result_dir = catfile $results_dir, $category;
        my $result_path = catfile $result_dir, $language;
        mkdir $result_dir unless -d $result_dir;
        my $cmd;
        if ($compiler{$language}) {
            my $compiled_filepath = $filepath;
            $compiled_filepath =~ s/\.[^.]+$/.exe/;
            my $compiler_cmd = $compiler{$language}->($filepath, $compiled_filepath);
            say $compiler_cmd;
            system $compiler_cmd;
            $cmd = "$runtime{$language} $compiled_filepath > $result_path";
        } else {
            $cmd = "$runtime{$language} $filepath > $result_path";
        }
        say $cmd;
        system $cmd;
    }
}
