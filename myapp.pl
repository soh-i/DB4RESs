#!/usr/bin/env perl

use Mojolicious::Lite;

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
    if ($sp =~ m/^\w+$/
        and $chr =~ m/(^chr\d+$)|(^\d+$)|(^[xyXY]{1}$)/
        and $region =~ m/^\d+$/) {
        $self->stash(sp => $sp);
        $self->stash(chr => $chr);
        $self->stash(region => $region);
        $self->render();
    } else {
        $self->render(text=>"Error: Invald data is given");
    }
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
