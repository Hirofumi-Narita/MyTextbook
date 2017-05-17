use strict;
use warnings;
use utf8;
use open ":utf8";

open (DATAFILE, ">", "dummy_data.sql") or die("Error:$!");

print DATAFILE "use IQrank;\n";
print DATAFILE "drop table if exists `members`;\n";

foreach (1..1000){
    my $name = 'test' . $_;
    my $text = sprintf("insert into members(id, login_id, login_pw, name, job, rank) values(%d, \"%s\", \"%s\", \"%s\", \"engineer\", %.5f);\n", $_, $name, $name, $name, rand(70));
    print DATAFILE $text;
}

close(DATAFILE);
