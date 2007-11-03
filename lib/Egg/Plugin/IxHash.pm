package Egg::Plugin::IxHash;
#
# Copyright (C) 2007 Bee Flag, Corp, All Rights Reserved.
# Masatoshi Mizuno E<lt>lusheE<64>cpan.orgE<gt>
#
# $Id$
#
use strict;
use warnings;
use Carp qw/croak/;
use Tie::Hash::Indexed;

our $VERSION = '2.03';

=head1 NAME

Egg::Plugin::IxHash - Tie::Hash::Indexed for Egg plugin.

=head1 SYNOPSIS

  use Egg qw/ IxHash /;

  my $ix= $e->ixhash( I => 1, n => 2, d => 3, e => 4 );
  $ix->{x} = 5;
  
  print keys %$ix, "\n";    # prints 'Index'
  print values %$ix, "\n";  # prints '12345'

=head1 METHOD

=head2 ixhash ( [HASH] )

HASH is returned and the HASH reference of receipt Tie::Hash::Indexed is returned.

=cut

sub ixhash {
	my $e= shift;
	tie my %ixHash, 'Tie::Hash::Indexed';
	return \%ixHash unless @_;
	%ixHash= @_;
	\%ixHash;
}

1;

=head1 SEE ALSO

L<Tie::Hash::Indexed>,
L<Egg::Release>,

=head1 AUTHOR

Masatoshi Mizuno E<lt>lusheE<64>cpan.orgE<gt>

=head1 COPYRIGHT

Copyright (C) 2007 by Bee Flag, Corp. E<lt>http://egg.bomcity.com/E<gt>, All Rights Reserved.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.6 or,
at your option, any later version of Perl 5 you may have available.

=cut

