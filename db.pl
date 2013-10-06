#!/usr/bin/env perl 

use strict;
use warnings;

use lib "lib";
use DB4RESs::Schema;

my $schema = DB4RESs::Schema->connect('dbi:SQLite:./test.db');
#$schema->deploy;

my $cotegory_rs = $schema->resultset('Base');
my $cotegory = $cotegory_rs->create({
                                     name => 'Foxp2',
                                     pos => 121,
                                     chr => "chr12",
                                     feature_id => 1,
                                     });
print $cotegory_rs->count();



