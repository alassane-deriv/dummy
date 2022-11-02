#!/usr/bin/perl

use strict;
use warnings;

$ENV{PGSERVICEFILE} = '/home/nobody/.pg_service_backprice.conf';

use BOM::MarketData   qw(create_underlying);
use VolSurface::Utils qw(get_strike_for_spot_delta);
use BOM::Config::Chronicle;
use Quant::Framework::VolSurface::Delta;
use Date::Utility;
use File::Slurp;
use List::Util qw(min); 


my $for_date   = Date::Utility->new('2022-09-07 09:00:00');
print ($)
my @underlying_name = 'frxAUDCAD';
 my $underlying = create_underlying($underlying_name, $for_date);
    my $volsurface = Quant::Framework::VolSurface::Delta->new(
        underlying       => $underlying,
        for_date         => $for_date,
        chronicle_reader => BOM::Config::Chronicle::get_chronicle_reader(1),



my @tenors = map {$_.'d'} sort {$a <=> $b} keys %{$volsurface->surface_data};
my @to = map {$for_date->plus_time_interval($_)} @tenors;
