#!/usr/bin/env perl

use strict;
use warnings FATAL => 'all';

use Test::More;
use IO::Capture::Stderr;

{
    require_ok("torque_statistics.pl");
}

{
    my $output_tex_file = "torque_statistics.tex";
    unlink $output_tex_file;
    my $error = system "perl torque_statistics.pl";
    ok( $error == 0,
        "Program returns zero without options" );
    ok( -f $output_tex_file,
        "TeX file created from program run" );
    unlink $output_tex_file;
}

{
    my $error = system "perl torque_statistics.pl --month=08";
    ok( $error == 0,
        "Program accepts --month option" );
}

{
    my $error = system "perl torque_statistics.pl --year=2013";
    ok( $error == 0,
        "Program accepts --year option" );
}

{
    my $error = system "perl torque_statistics.pl --month=08 --year=2013";
    ok( $error == 0,
        "Program accepts --month and --year option" );
}

done_testing( 6 );

# vim: expandtab shiftwidth=4
