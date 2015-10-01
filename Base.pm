package Base;
use strict;
use warnings;

sub new {
    my $self = bless {}, shift;

    $self->{ code_ref } = sub { print 'Hello, World'; };
    $self->{ data     } = 'just a timestamp: ' . time;

    return $self;
}

sub FREEZE {
    my $self = shift;

    delete $self->{ code_ref };

    my $data = {};
    foreach my $k ( keys %$self ) {
        $data->{ $k } = $self->{ $k };
    }
    return $data;
}

sub THAW {
    my ( $class, undef, $data ) = @_;

    return bless $data, $class;
}

1;
