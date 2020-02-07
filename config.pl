our @languages = qw(
    javascript
    lua
    c++
    c#
    nim
    ruby
    perl
    nqp
    perl6
);

our %compiler = (
    "c++" => sub {
        my ($src, $out) = @_;
        "clang++ -std=c++17 -O3 -o $out $src";
    },
    "c#" => sub {
        my ($src) = @_;
        my $project = $src;
        $project =~ s@c#[/\\](.+)\.cs@c#-project/$1.csproj@;
        "dotnet build --configuration Release $project";
    },
    nim => sub {
        my ($src, $out) = @_;
        "nim c --nimcache:nimcache -d:release --opt:speed -o:$out $src";
    },
);

our %runtime = (
    perl6 => "perl6",
    nqp => "nqp",
    perl => "perl",
    javascript => "node",
    lua => "luajit",
    "c++" => "",
    "c#" => sub {
        my ($src, $result) = @_;
        $src =~ s@c#[/\\](.+)\.exe@c#-project/bin/Release/netcoreapp3.1/$1.dll@;
        "dotnet $src > $result";
    },
    nim => "",
    ruby => "ruby",
);

our %version = (
    perl6 => sub { my $ver = `perl6 --version`; ($ver =~ /Rakudo version (\S+)/)[0]; },
    nqp => sub { my $ver = `nqp --version`; ($ver =~ /nqp version (\S+)/)[0]; },
    perl => sub { my $ver = `perl --version`; ($ver =~ /(v\d+\.\d+\.\d+)/)[0]; },
    javascript => sub { my $ver = `node --version`; ($ver =~ /(v\d+\.\d+\.\d+)/)[0]; },
    lua => sub { my $ver = `luajit -v`; ($ver =~ /LuaJIT (\d+\.\d+\.\d+)/i)[0]; },
    "c++" => sub { my $ver = `clang --version`; ($ver =~ /version (\d+\.\d+\.\d+)/i)[0]; },
    "c#" => sub { my $ver = `dotnet --version`; $ver =~ s/[\r\n]//g; $ver; },
    nim => sub { my $ver = `nim --version 2>&1`; ($ver =~ /Version (\d+\.\d+\.\d+)/i)[0]; },
    ruby => sub { my $ver = `ruby --version`; ($ver =~ /^ruby (\S+)/)[0]; },
);
