package Template::Plugin::MultiMarkdown;

use strict;

use vars qw($text_mmd_class);
use parent qw (Template::Plugin::Filter);
use Carp;

BEGIN {
    $text_mmd_class = 'Text::MultiMarkdown::XS';
    eval 'require Text::MultiMarkdown::XS';
    if ($@) {
	$text_mmd_class = 'Text::MultiMarkdown';
	eval 'require Text::MultiMarkdown';
	if ($@) {
	    croak "cannot load either Text::MultiMarkdown::XS or Text::MultiMarkdown";
	}
    }
}
    

our $VERSION = 0.04;

sub init {
    my $self = shift;
    $self->{_DYNAMIC} = 1;
    $self->install_filter($self->{_ARGS}->[0] || 'multimarkdown');
    return $self;
}

sub filter {
    my ($self, $text, $args, $config) = @_;

    $config ||= {};

    my $req_class = delete $config->{implementation} || '';

    if ($req_class eq 'PP') {
	require Text::MultiMarkdown;
	return Text::MultiMarkdown->new(%$config)->markdown($text);
    }
    elsif ($req_class eq 'XS') {
	require Text::MultiMarkdown::XS;
	return Text::MultiMarkdown::XS->new($config)->markdown($text);
    }
    else {
	return $text_mmd_class->new(%$config)->markdown($text);
    }
}

1;

__END__

=head1 NAME

Template::Plugin::MultiMarkdown - TT plugin for Text::MultiMarkdown

=head1 SYNOPSIS

  [% USE MultiMarkdown -%]
  [% FILTER multimarkdown %]
  #Foo
  Bar
  ---
  *Italic* blah blah
  **Bold** foo bar baz
  [%- END %]

  [% USE MultiMarkdown -%]
  [% FILTER multimarkdown( document_format => 'complete' ) %]
  ...
  [% END %]


=head1 DESCRIPTION

C<Template::Plugin::MultiMarkdown> wraps C<Text::MultiMarkdown::XS> and
C<Text::MultiMarkdown> into a Template Toolkit plugin, and will filter your MultiMarkdown
text into HTML.  By default the plugin will select the XS implementation over the pure
perl version, but the implementation can be chosen explictly by specifying a parameter
C<implementation> to the C<multimarkdown> filter.

NOTE: C<Text::MultiMarkdown::XS> is a new module and the interface to that module is still
liable to change.


=head1 SUBROUTINES/METHODS

There are two methods required by the TT plugin API:

=over 4

=item C<init()>

=item C<filter()>

=back

=head1 VERSION

This man page describes version 0.04.

=head1 SEE ALSO

L<Template>, L<Text::MultiMarkdown>, L<http://fletcherpenney.net/multimarkdown/>

=head1 AUTHOR

Andrew Ford E<lt>A.Ford@ford-mason.co.ukE<gt> (based on the
L<Template::Plugin::Markdown> TT plugin by Naoya Ito
E<lt>naoya@bloghackers.netE<gt>).

=head1 LICENSE AND COPYRIGHT

Copyright (C) 2009 Andrew Ford

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

