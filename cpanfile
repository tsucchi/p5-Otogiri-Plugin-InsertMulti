requires 'perl', '5.008001';

requires 'Otogiri';
requires 'Otogiri::Plugin';

on 'test' => sub {
    requires 'Test::More', '0.98';
    requires 'DBD::SQLite';
};

