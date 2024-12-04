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

@leftArr = sort(@leftArr);
@rightArr = sort(@rightArr);

my $sum = 0;
for my $i(0 .. $#leftArr){
    $div = @leftArr[$i] - @rightArr[$i];
    $absDiv = abs($div);
    $sum += $absDiv;
}

print $sum;