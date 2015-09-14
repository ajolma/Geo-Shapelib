use ExtUtils::MakeMaker;

my $shapelib_version = '1.2.0';

my @shapelib_version = $shapelib_version =~ /(\d)\.(\d)\.(\d)/;
my $libs;
my $inc;
my $define;
if ($shapelib_version[0]*10000+$shapelib_version[1]*100+$shapelib_version[2] >= 10300) {
    $libs = ['-L/home/ajolma/Lataukset/shapelib-1.3.0 -lshp'];
    $inc = '-I/home/ajolma/Lataukset/shapelib-1.3.0';
    $define = '-DSHAPELIB_1_3_0';
} else {
    $libs = ['-L/usr/local/lib -L/usr/lib/x86_64-linux-gnu -lshp'];
    $inc = '-I/usr/local/include';
    $define = undef;
}

WriteMakefile(
    NAME                => 'Geo::Shapelib',
    VERSION_FROM        => 'lib/Geo/Shapelib.pm',
    PREREQ_PM           => {Tree::R => 0.01}, # e.g., Module::Name => 1.1
    ABSTRACT_FROM       => 'lib/Geo/Shapelib.pm',
    LIBS                => $libs,
    DEFINE              => $define,
    INC                 => $inc,
    clean               => {'FILES' => 'stations.* example/test.*'},
    AUTHOR              => 'Ari Jolma <https://github.com/ajolma>',
    LICENSE             => 'perl_5',
    META_MERGE => {
        'meta-spec' => { version => 2 },
        resources => {
            repository  => {
                type => 'git',
                web  => 'https://github.com/ajolma/Geo-Shapelib',
                url  => 'https://github.com/ajolma/Geo-Shapelib.git',
            },
        },
    }
);
