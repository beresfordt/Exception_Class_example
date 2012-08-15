#!/usr/bin/perl

BEGIN{
    chdir 't' if -d 't' ;
    use lib '../lib/';
}


use 5.014 ;

use strict ;
use autodie ;
use warnings ;
use Carp qw< carp croak confess cluck > ;
use Try::Tiny ;
use Data::Dumper ;
use Test::More ;

local $SIG{__DIE__} = sub {
    confess "Uncaught exception: @_" unless $^S ;
} ;

local $SIG{__WARN__} = sub {
    cluck "@_" ;
} ;

use_ok( 'Foo::Bar' ) ;

__DATA__

