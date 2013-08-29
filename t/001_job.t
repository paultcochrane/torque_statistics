#!/usr/bin/env perl

use warnings;
use strict;

use Test::More tests => 8;

BEGIN {
    use_ok( 'Job' );
}

{
    my $job = Job->new();
    isa_ok( $job, 'Job' );
}

{
    my $job = Job->new();
    is( $job->jobid, undef, "Job ID is undef after new" );
    $job->jobid(01234);
    is( $job->jobid, 01234, "Job ID set correctly" );
}

{
    my $job = Job->new();
    is( $job->username, undef, "Username is undef after new" );
    $job->username( "barry" );
    is( $job->username, "barry", "Username set correctly" );
}

{
    my $job = Job->new();
    is( $job->groupname, undef, "Groupname is undef after new" );
    $job->groupname( "zzzz" );
    is( $job->groupname, "zzzz", "Groupname set correctly" );
}

# vim: expandtab shiftwidth=4
