#!perl 

use strict;
use warnings;

use Acme::Roman;

# Compute factorials
sub fact {
    my $n = shift;
    return ( $n==I ) ? I : $n*fact( $n-1 );
}

for ( I, II, III, IV, V, VI ) { # I..VI does not work :(
    printf "%s! = %s\n", $_, fact($_);
}

print "\n";

use Memoize;
memoize( 'fib' ); # make it fast

# Compute Fibonacci numbers (from "perldoc Memoize")
sub fib {
    my $n = shift;
    return $n if $n < 2;
    fib($n-1) + fib($n-2);
}

for ( I, II, III, IV, V, VI, VII, VIII, IX, X ) {
    printf "fib(%s) = %s\n", $_, fib($_);
}

print "\n";

use Term::ReadLine qw( readline );
my $term = Term::ReadLine->new( 'A guessing game' );
print <<GAME;
A guessing game:

Enter roman or arabic numerals to answer.
Just ENTER to quit.

GAME

while (1) {
    my $n1 = int(rand(20))+I; # I .. XX
    my $n2 = int(rand(20))+I; # I .. XX
    my $input = $term->readline("$n1 + $n2 = ");
    last unless $input;

    my $sum = $n1+$n2;
    my $ans = $input;
    if ( $sum-$ans==0 ) {
        print "Right!\n";
    } else {
        print "Wrong!\n";
    }
}

print "Bye\n";
