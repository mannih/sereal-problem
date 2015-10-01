package Child;
use strict;
use warnings;

use base 'Base';

sub test {
    my $self = shift;
    &{ $self->{ code_ref } };
}

1;
