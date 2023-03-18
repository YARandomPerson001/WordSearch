#!usr/bin/env perl

use strict;
use warnings;

my $file, my $word;
my $str = "";

my $wct = 0;
my $counter = 0;

# Check arguments
foreach my $arg (@ARGV)
{
    if($arg eq "-h")       { print "-h        | --help          - List of arguments.\n";
                             print "-s (Word) | --search (Word) - Look the the amount & where the word appears.\n";
                             print "-f (File) | --file (File)   - The file to look though.\n"; }
    if($arg eq "--help")   { print "-h        | --help          - List of arguments.\n";
                             print "-s (Word) | --search (Word) - Look the the amount & where the word appears.\n";
                             print "-f (File) | --file (File)   - The file to look though.\n"; }

    if($arg eq "-s")       { if(defined $ARGV[$counter+1]) { $word = $ARGV[$counter+1]; } }
    if($arg eq "--search") { if(defined $ARGV[$counter+1]) { $word = $ARGV[$counter+1]; } }


    if($arg eq "-f")       { if(defined $ARGV[$counter+1]) { $file = $ARGV[$counter+1]; } }
    if($arg eq "--file")   { if(defined $ARGV[$counter+1]) { $file = $ARGV[$counter+1]; } }

    $counter++;
}

if(not defined $file) { print "That file to read from: "; $file = <STDIN>; }
if(not defined $word) { print "What word to look for: ";  $word = <STDIN>; }

# Open file and read data
open(FH, "<$file") or die "Failed to open the file. $file\n";
while(<FH>) { $str = $str.$_; };
close(FH);

# Print the count
print "The word \"$word\" appeared "; 
foreach my $val (split(' ', $str)) { if(not index(lc $val, lc $word)) { $wct++; }; }
print "$wct times!\n";

# Loop though



