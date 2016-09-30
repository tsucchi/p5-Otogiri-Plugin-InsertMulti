package Otogiri::Plugin::InsertMulti;
use 5.008001;
use strict;
use warnings;

our $VERSION = "0.01";

use Otogiri;
use Otogiri::Plugin;

our @EXPORT = qw(insert_multi);

BEGIN {
    SQL::Maker->load_plugin('InsertMulti');
}

sub insert_multi {
    my ($self, $table, @args) = @_;

    my ($sql, @binds) = $self->maker->insert_multi($table, @args);
    return $self->search_by_sql($sql, \@binds, $table);
}


1;
__END__

=encoding utf-8

=head1 NAME

Otogiri::Plugin::InsertMulti - Otogiri plugin to insert multiple rows using L<SQL::Maker::InsertMulti>

=head1 SYNOPSIS

    use Otogiri::Plugin::InsertMulti;

    my $db = Otogiri->new(...);
    $db->load_plugin('InsertMulti');
    $db->insert_multi('person', [
        { name => 'Sherlock', age => 15 },
        { name => 'Nero',     age => 15 },
        { name => 'Hercule',  age => 16 },
        { name => 'Cordelia', age => 17 },
    ]);


=head1 DESCRIPTION

Otogiri::Plugin::InsertMulti is plugin for Otogiri which enables builk insert using L<SQL::Maker::InsertMulti>.

=head1 LICENSE

Copyright (C) Takuya Tsuchida.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Takuya Tsuchida E<lt>tsucchi@cpan.orgE<gt>

=cut

