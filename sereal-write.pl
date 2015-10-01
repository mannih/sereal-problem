#!/usr/bin/perl
use strict;
use warnings;

use Sereal::Encoder;
use Child;
use IO::File;

my $child      = Child->new;
my $serialized = Sereal::Encoder->new( { freeze_callbacks => 1 } )->encode( $child );

sysopen( my $fh, 'data.serialized', O_RDWR|O_CREAT );
print $fh $serialized;
$fh->flush;

