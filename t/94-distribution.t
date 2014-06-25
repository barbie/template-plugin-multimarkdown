#!/usr/bin/env perl
use warnings;
use strict;

use Test::More;

use Cwd qw(abs_path);
use FindBin qw($Bin);

use lib ($Bin, "$Bin/../lib", "lib");

BEGIN {
    if ( not $ENV{RELEASE_TESTING} ) {
        my $msg = 'Author test.  Set $ENV{RELEASE_TESTING} to a true value to run.';
        plan( skip_all => $msg );
    } else {
        eval { require Test::Distribution; };
        if($@) {
            plan skip_all => 'Test::Distribution not installed';
        } else {
            import Test::Distribution;
        }
    }
}
