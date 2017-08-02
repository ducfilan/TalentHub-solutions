# In the olden days, playing marbles used to be every kid's favorite game. George is a marble collector. He has a special habit of putting marbles of the same color into one box and numbering each marble contained therein, starting from 1 (i.e: there are 5 marbles in a box, and they are respectively numbered from 1 to 5).
# 
# One day, Richie came to visit George. The two played marbles together and after a while, Richie suddenly came up with a new game: to count the available alternatives to pick a marble from each box so that any two chosen marbles have different numbers.
# 
# However, as the boys could not reach an agreement on their results, they asked for your support in coding a program which could deliver the correct result.
# 
# Constraints:
# + n <= 10^5
# + Number of marbles in each box <= 10^5.
# 
# Input:
# + The first line contains an integer N as the number of marble-containing boxes, followed by n numbers representing the respective number of marbles contained in the boxes.
# 
# Output:
# + Print the result. As it could be a large number, you can output it as modulo 10^9+7.
# 
# Sample:
# Input
# 3
# 2 3
# 
# Output
# 4

use constant MOD_FACTOR => 1000000007;

my $n = <STDIN>;
my @marbles;

for (my $i=0; $i < $n; $i++) {
   push @marbles, <STDIN>;
}

my $ways_count = 1;

@marbles = sort { $a <=> $b } @marbles;

my $i = 0;
foreach my $marble (@marbles) {
    $ways_count = $ways_count*($marble-$i)%MOD_FACTOR;
    $i +=1;
}

print $ways_count;