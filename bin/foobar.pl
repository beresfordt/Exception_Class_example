#!/usr/bin/perl

use 5.014 ;

use strict ;
use autodie ;
use warnings ;
use Carp qw< carp croak confess cluck > ;
use Try::Tiny ;
use Data::Dumper ;
use Foo::Bar ;

local $SIG{__DIE__} = sub {
    confess "Uncaught exception: @_" unless $^S ;
} ;

local $SIG{__WARN__} = sub {
    cluck "@_" ;
} ;

my $bar = Foo::Bar->new ;

my $r = try{
    $bar->open('/dud') ;
}
catch{

    # if we've not caught an Exception::Class exception object do blah
    # in this case die
    die unless ref $_ ;

    # check exception object type blahblahblah
    if ( ref $_ eq 'Foo::Bar::Exception::IO' ){
        warn $_->error ;
        # log $_->error, "\n", $_->trace->as_string, "\n" ;
    }
    elsif( ref $_ eq 'Foo::Bar::Exception::System' ){
        warn $_->error ;
        # log $_->error, "\n", $_->trace->as_string, "\n" ;
        die ;
    }
    else{
        # log $_->error, "\n", $_->trace->as_string, "\n" ;
        die $_->error, "\n", $_->trace->as_string, "\n" ;
    }
} ;

__DATA__

