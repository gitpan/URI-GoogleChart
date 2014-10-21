#!perl

use strict;
use Test;
plan tests => 7;

use URI::GoogleChart;

my $u;
$u = URI::GoogleChart->new("lines", 200, 200);
ok($u, "http://chart.apis.google.com/chart?cht=lc&chs=200x200");

$u = URI::GoogleChart->new("lines", 200, 200,
    data => [3,1,2],
    title => "foo",
    margin => 5,
    encoding => "t",
);
ok($u, "http://chart.apis.google.com/chart?cht=lc&chs=200x200&chd=t:100,0,50&chma=5,5,5,5&chtt=foo");

$u = URI::GoogleChart->new("lines", 200, 200,
    data => [3,1,2],
    title => "foo",
    margin => 5,
    encoding => "s",
);
ok($u, "http://chart.apis.google.com/chart?cht=lc&chs=200x200&chd=s:9Ae&chma=5,5,5,5&chtt=foo");

$u = URI::GoogleChart->new("lines", 200, 200,
    data => [3,1,2],
    title => "foo",
    margin => 5,
    encoding => "e",
);
ok($u, "http://chart.apis.google.com/chart?cht=lc&chs=200x200&chd=e:..AAf.&chma=5,5,5,5&chtt=foo");

$u = URI::GoogleChart->new("lines", 200, 200,
    min => 0,
    data => [3,1,2],
);
ok($u, "http://chart.apis.google.com/chart?cht=lc&chs=200x200&chd=t:100,33.3,66.7");

$u = URI::GoogleChart->new("lines", 200, 200,
    min => 0,
    max => 10,
    data => [3,1,2],
);
ok($u, "http://chart.apis.google.com/chart?cht=lc&chs=200x200&chd=t:30,10,20");

$u = URI::GoogleChart->new("europe", 440, 220);
ok($u, "http://chart.apis.google.com/chart?cht=t&chtm=europe&chs=440x220");
