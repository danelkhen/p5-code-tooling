package Source::Tooling::Perl::Stats;

use v5.22;
use warnings;
use experimental 'signatures';

our $VERSION     = '0.01';
our $AUTHORITY   = 'cpan:STEVAN';
our $DEBUG       = 0;
our $IS_ABSTRACT = 1;

sub ppi;

sub source     ($self) { $self->ppi->content }
sub line_count ($self) { scalar split /\n/ => $self->source }

1;

__END__
