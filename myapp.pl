#!/usr/bin/env perl
use Mojolicious::Lite;

# Documentation browser under "/perldoc"1;2D
plugin 'PODRenderer';

get '/' => sub {
  my $self = shift;
  $self->render('index');
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

