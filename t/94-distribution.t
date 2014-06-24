#!/usr/bin/perl
# $Id: 94-distribution.t 4103 2009-03-02 20:41:50Z andrew $

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
