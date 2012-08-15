#!/usr/bin/perl

use 5.014 ;

use strict ;
use autodie ;
use warnings ;
use Carp qw< carp croak confess cluck > ;
use Try::Tiny ;
use Data::Dumper ;

local $SIG{__DIE__} = sub {
    confess "Uncaught exception: @_" unless $^S ;
} ;

local $SIG{__WARN__} = sub {
    cluck "@_" ;
} ;

__DATA__

