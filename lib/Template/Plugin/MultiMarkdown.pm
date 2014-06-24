#$Id: MultiMarkdown.pm 4103 2009-03-02 20:41:50Z andrew $
package Template::Plugin::MultiMarkdown;
use strict;
use base qw (Template::Plugin::Filter);
use Text::MultiMarkdown;

our $VERSION = 0.02;

sub init {
    my $self = shift;
    $self->{_DYNAMIC} = 1;
    $self->install_filter($self->{_ARGS}->[0] || 'multimarkdown');
    $self;
}

sub filter {
    my ($self, $text, $args, $config) = @_;
    my $m = Text::MultiMarkdown->new(%{$config || {}});
    return $m->markdown($text);
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

=head1 DESCRIPTION

Template::Plugin::MultiMarkdown is a plugin for TT, which will format
your text with MultiMarkdown Style.

=head1 METHODS AND SUBROUTINES

There are two methods required by the TT plugin API:

=over 4

=item C<init()>

=item C<filter()>

=back

=head1 SEE ALSO

L<Template>, L<Text::MultiMarkdown>, L<http://fletcherpenney.net/multimarkdown/>

=head1 AUTHOR

Andrew Ford E<lt>A.Ford@ford-mason.co.ukE<gt> (based on the
L<Template::Plugin::Markdown> TT plugin by Naoya Ito
E<lt>naoya@bloghackers.netE<gt>).

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

