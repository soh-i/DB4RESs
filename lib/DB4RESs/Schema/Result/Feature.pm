package DB4RESs::Schema::Result::Feature;
use strict;
use warnings;
use parent 'DBIx::Class::Schema';

__PACKAGE__->load_components(qw/Core/);
__PACKAGE__->table("feature");
__PACKAGE__->add_columns(
                         feature_id => {
                                data_type => "INTEGER",
                                is_auto_increment => 1,
                                is_nullable => 0,
                                },
                         edit_type => {
                                       data_type => "VARCHAR",
                                       is_nullable => 0,
                                      },
                         edit_ratio=> {
                                       data_type => "INTEGER",
                                       is_nullable => 0,
                                },
                         region => {
                                    data_type => "VARCHAR",
                                    is_nullable => 0,
                                   },
                         coverage => {
                                      data_type => "INTEGER",
                                      is_nullable => 0,
                                     }
                        );

__PACKAGE__->set_primary_key("feature_id");
#__PACKAGE__->belongs_to(base => 'DB4RESs::Schema::Result::Base','base_id');

1;
