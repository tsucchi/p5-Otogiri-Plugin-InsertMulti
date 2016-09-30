use strict;
use warnings;
use Test::More;
use Otogiri;
use Otogiri::Plugin;

my $dbfile  = ':memory:';

subtest 'insert', sub {
    my $db = _setup();
    $db->load_plugin('InsertMulti');
    $db->insert_multi('person', [
        { name => 'Sherlock', age => 15 },
        { name => 'Nero',     age => 15 },
        { name => 'Hercule',  age => 16 },
        { name => 'Cordelia', age => 17 },
    ]);
    my @persons = $db->select('person');
    is( scalar(@persons), 4 );
};


done_testing;


sub _setup {
    my $db = Otogiri->new(
        connect_info => ["dbi:SQLite:dbname=$dbfile", '', '', { RaiseError => 1, PrintError => 0 }],
        strict       => 0,
    );

    my @sql_statements = split /\n\n/, <<EOSQL;
PRAGMA foreign_keys = ON;

CREATE TABLE person (
  id   INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT    NOT NULL,
  age  INTEGER NOT NULL DEFAULT 20
);

CREATE TABLE detective (
  id        INTEGER PRIMARY KEY AUTOINCREMENT,
  person_id INTEGER NOT NULL,
  toys      TEXT  NOT NULL,
  FOREIGN KEY(person_id) REFERENCES person(id)
);
EOSQL
    $db->do($_) for @sql_statements;
    return $db;
}
