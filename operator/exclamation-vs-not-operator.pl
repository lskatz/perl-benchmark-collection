#!/usr/bin/perl -w
# ! v.s. not operator
use strict;
use warnings;
use Benchmark ':all';
use Test::More 'no_plan';

sub exclamation { my $x = shift; return(1) if ! $x; }
sub notoperator { my $x = shift; return(1) if not $x; }

ok( exclamation(0) );
ok( notoperator(0) );

cmpthese(500000, { 
	'! $_' => sub { &exclamation(0) }, 
	'not $_' => sub { &notoperator(0) }, 
});

__END__

* PowerBookG4/perl 5.8.8
           Rate not $_   ! $_
not $_ 877193/s     --    -2%
! $_   892857/s     2%     --

* PowerBookG4/perl 5.10.0
           Rate not $_   ! $_
not $_ 724638/s     --    -4%
! $_   757576/s     5%     --

* PowerBookG4/perl 5.12.0
           Rate not $_   ! $_
not $_ 675676/s     --    -3%
! $_   694444/s     3%     --
