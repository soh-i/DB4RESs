package DB4RESs::Schema::Result::Base;

use strict;
use warnings;
use parent 'DBIx::Class::Schema';

__PACKAGE__->load_components(qw/Core/);
__PACKAGE__->table("base");
__PACKAGE__->add_columns(
                         b_id => {
                                data_type => "INTEGER",
                                is_auto_increment => 1,
                                is_nullable => 0,
                                },
                         name => {
                                  data_type => "VARCHAR",
                                  is_nullable => 0,
                                 },
                         pos => {
                                 data_type => "INTEGER",
                                 is_nullable => 0,
                                },
                         chr => {
                                 data_type => "VARCHAR",
                                 is_nullable => 0,
                                },
                         feature_id => {
                                        data_type => "INTEGER",
                                        is_nullable => 0,
                                       },
                        );
__PACKAGE__->set_primary_key("b_id");
__PACKAGE__->has_many(feature => 'DB4RESs::Schema::Result::Base', 'b_id');

1;
