#!/usr/bin/env perl

use Mojolicious::Lite;
use lib qw{lib};
use DB4RESs::Generator::InsertDB;
#my $t = DB4RESs::Generator::InsertDB->new("test");
#print $t;
#$t->read_file();

plugin 'PODRenderer';

get '/' => sub {
  my $self = shift;
  $self->render('index');
};

get '/result' => sub {
    my $self = shift;

    my $sp = $self->param('sp');
    my $chr = $self->param('chr');
    my $region = $self->param('region');
    
    if (!$sp or !$chr or !$region) {
        $self->render(text=>"Error: Value is empty");
    }
    
    if ($sp =~ m/^Human$/) {
        if ($chr =~ m/(^chr\d+$)|(^\d+$)|(^[xyXY]{1}$)/
            and $region =~ m/^\d+$/) {
            $self->stash(sp => $sp);
            $self->stash(chr => $chr);
            $self->stash(region => $region);
            $self->render();
        } else {
            _value_error($self);
        }
    }
    elsif ($sp =~ m/^Fruit_fly$/) {
        if ($chr =~ m/(3L)|([XU])|(Uextra)|(2RHet)|(3LHet)|(3R)|(3RHet)|(YHet)|(2L)|(2LHet)|(2R)(XHet)/
            and $region =~ m/^\d+$/) {
            $self->stash(sp => $sp);
            $self->stash(chr => $chr);
            $self->stash(region => $region);
            $self->render();
        } else {
            _value_error($self);
        }
    }
    elsif ($sp =~ m/^Mouse$/) {
        if ($chr =~ /^\d+$/
            and $region =~ m/^\d+$/) {
            $self->stash(sp => $sp);
            $self->stash(chr => $chr);
            $self->stash(region => $region);
            $self->render();
        }
        else {
            _value_error($self);
        }
    } else {
        _value_error($self);
    }
};

sub _value_error {
    my $s = shift;
    return $s->render(inline=>"<p><b>Error: invalid data is given</p>");
};
    

get '/about' => sub {
    my $self = shift;
    $self->render('about');
};

get '/download' => sub {
    my $self = shift;
    $self->render('download');
};

get '/help' => sub {
    my $self = shift;
    $self->render("help");
};

get "/contact" => sub {
    my $self = shift;
    $self->render("contact");
};


app->start;
