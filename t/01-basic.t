use strict;
use warnings;
use Test::More tests => 6;
use Text::Password::Pronounceable::RandomCase;

my $pp = Text::Password::Pronounceable::RandomCase->new(6, 10, 1);

isa_ok($pp,'Text::Password::Pronounceable::RandomCase','is Text::Password::Pronounceable::RandomCase object');

my $password = $pp->generate();

ok($password,'password was generated');
ok(length $password > 5 || length $password < 11,'password has right size');
ok( $password !~ /[a-z]/, 'password has not lower case characters with frequency 1');

$password = $pp->generate(40,40,2);

ok(length $password eq 40 ,'password has right size with $min == $max');
ok( $password =~ /[a-z]/ and $password =~ /[A-Z]/, 'long password has lower and upper case characters (frequency 2)');
