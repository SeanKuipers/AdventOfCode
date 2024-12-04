#!/usr/bin/perl
use warnings;
use String::Util 'trim';
$filename = "input";
open(FH, $filename) or die "File  '$filename' can't be opened";

my @arr;
while(<FH>)
{
    push(@arr, $_);
}
my @leftArr;
my @rightArr;
foreach(@arr){
    my($left, $right) = split(' ', $_, 2);
    $left = trim($left);
    $right = trim($right);
    push(@leftArr, $left);
    push(@rightArr, $right);
}

my $sum = 0;
foreach(@leftArr){
    my $count = 0;
    my $lVal = $_;
    foreach(@rightArr){
        if($lVal == $_) {
            $count++;
        }
    }
    $sum += $lVal * $count;
}

print $sum;