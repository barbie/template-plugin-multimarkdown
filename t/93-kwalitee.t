#!/usr/bin/perl
# $Id: 93-kwalitee.t 4103 2009-03-02 20:41:50Z andrew $

use Test::More;

eval { require Test::Kwalitee; Test::Kwalitee->import() };

plan( skip_all => 'Test::Kwalitee not installed; skipping' ) if $@;
