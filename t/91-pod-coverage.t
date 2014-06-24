#!/usr/bin/perl
# $Id: 91-pod-coverage.t 4103 2009-03-02 20:41:50Z andrew $

use Test::More;
eval "use Test::Pod::Coverage";
plan skip_all => "Test::Pod::Coverage required for testing pod coverage" if $@;
all_pod_coverage_ok();




