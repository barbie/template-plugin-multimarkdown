#!/usr/bin/env perl

use strict;

use Test::More;

use Cwd qw(abs_path);
use FindBin qw($Bin);

use lib ($Bin, "$Bin/../lib", "lib");

BEGIN {
    eval {
        require Test::Distribution;
    };
    if($@) {
        plan skip_all => 'Test::Distribution not installed';
    }
    else {
        import Test::Distribution;
    }
}
