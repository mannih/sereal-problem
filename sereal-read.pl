#!/usr/bin/perl
use strict;
use warnings;

use Sereal::Decoder;
use IO::File;
use Data::Dumper;

sysopen( my $fh, 'data.serialized', O_RDWR|O_CREAT );
my $serialized = '';
while (my $line = <$fh>) {
    $serialized .= $line;
}

my $child = Sereal::Decoder->new( { freeze_callbacks => 1 } )->decode( $serialized );
warn Dumper( $child );
