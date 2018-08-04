our @languages = qw(
    javascript
    lua
    c++
    nim
    ruby
    perl
    perl6
);

our %compiler = (
    "c++" => sub {
        my ($src, $out) = @_;
        "clang++ -std=c++17 -O3 -o $out $src";
    },
    nim => sub {
        my ($src, $out) = @_;
        "nim c --nimcache:nimcache -d:release --opt:speed -o:$out $src";
    },
);

our %runtime = (
    perl6 => "perl6",
    perl => "perl",
    javascript => "node",
    lua => "luajit",
    "c++" => "",
    nim => "",
    ruby => "ruby",
);

our %version = (
    perl6 => sub { my $ver = `perl6 --version`; ($ver =~ /Rakudo version (\S+)/)[0]; },
    perl => sub { my $ver = `perl --version`; ($ver =~ /(v\d+\.\d+\.\d+)/)[0]; },
    javascript => sub { my $ver = `node --version`; ($ver =~ /(v\d+\.\d+\.\d+)/)[0]; },
    lua => sub { my $ver = `luajit -v`; ($ver =~ /LuaJIT (\d+\.\d+\.\d+)/i)[0]; },
    "c++" => sub { my $ver = `clang --version`; ($ver =~ /version (\d+\.\d+\.\d+)/i)[0]; },
    nim => sub { my $ver = `nim --version`; ($ver =~ /Version (\d+\.\d+\.\d+)/i)[0]; },
    ruby => sub { my $ver = `ruby --version`; ($ver =~ /^ruby (\S+)/)[0]; },
);
