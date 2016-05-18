#!perl

use v5.22;
use warnings;

use lib 'lib';

use experimental 'say';

use Data::Dumper ();
use Path::Class  ();

use Importer 'Code::Tooling::Util::JSON' => qw[ decode ];

sub main {
    my $file = Path::Class::File->new( 'report.json' );
    my $content = $file->slurp;
    my $modules = decode($content);
    for my $module ( @$modules ) {
        say '---------analyzing module',$module->{namespace},'---------';
        if(!keys $module->{meta}->{cpan}) {
            say 'No CPAN entry';
        }
        if( defined $module->{meta}->{cpan}
            && defined $module->{meta}->{cpan}->{version_numified}
            && defined $module->{meta}->{version}) {
            my $version_difference = $module->{meta}->{cpan}->{version_numified} - $module->{meta}->{version};
            say 'versions differ by ',$version_difference if($version_difference>0);
        }
        say '------------------------------------------------------';
    }
}

main && exit;
1;
