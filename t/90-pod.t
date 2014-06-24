#!/usr/bin/perl
# $Id: 90-pod.t 4103 2009-03-02 20:41:50Z andrew $

use Test::More;
eval "use Test::Pod 1.00";
plan skip_all => "Test::Pod 1.00 required for testing POD" if $@;
all_pod_files_ok();
