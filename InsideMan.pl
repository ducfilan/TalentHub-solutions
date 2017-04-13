# Objective:
# Given a String S and a String P, count the number of times the pattern P appears in S.
# Note: The program should be case-insensitive.
# 
# Example:
# 
# Input:
# abcdcdCdba
# cD
# 
# Output
# 3
# 
# Input:
# cdcdcdcd
# cdcd
# 
# Output
# 3

$x = <STDIN>;
$y = <STDIN>;
$c = () = $x =~ /(?<=$y)/gi;
print $c;