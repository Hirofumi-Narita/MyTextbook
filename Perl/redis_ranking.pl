#!/usr/bin/env perl
use strict;
use warnings;
use utf8;
use feature qw/say/;

use Redis;
use Redis::LeaderBoard;

my ($name, $score) = @ARGV;

my $redis = Redis->new;
my $lb = Redis::LeaderBoard->new(
    redis => $redis,
    key   => 'myrank',
);

$lb->set_score($name, $score);

for my $row (@{$lb->rankings(limit => 10)}) {
    say join ' ', @$row{qw/rank member score/};
}
