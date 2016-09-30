# NAME

Otogiri::Plugin::InsertMulti - Otogiri plugin to insert multiple rows using [SQL::Maker::InsertMulti](https://metacpan.org/pod/SQL::Maker::InsertMulti)

# SYNOPSIS

    use Otogiri::Plugin::InsertMulti;

    my $db = Otogiri->new(...);
    $db->load_plugin('InsertMulti');
    $db->insert_multi('person', [
        { name => 'Sherlock', age => 15 },
        { name => 'Nero',     age => 15 },
        { name => 'Hercule',  age => 16 },
        { name => 'Cordelia', age => 17 },
    ]);

# DESCRIPTION

Otogiri::Plugin::InsertMulti is plugin for Otogiri which enables builk insert using [SQL::Maker::InsertMulti](https://metacpan.org/pod/SQL::Maker::InsertMulti).

# LICENSE

Copyright (C) Takuya Tsuchida.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

Takuya Tsuchida <tsucchi@cpan.org>
