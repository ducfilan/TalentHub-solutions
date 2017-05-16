# The numbers 1 to 10 are usually expressed in Roman numerals as follows:
# 
# I, II, III, IV, V, VI, VII, VIII, IX, X
# 
# Symbols are placed from left to right in order of value, starting with the largest. However, in a few specific cases, to avoid four characters being repeated in succession (such as IIII or XXXX), subtractive notation is used:
# 
# Number 4 9 40 90 400 900
# Notation IV IX XL XC CD CM
# 
# Now, please write a program to convert an integer to Roman numerals
# 
# Sample 
# Input:
# 4
# 
# Output:
# IV
# 
# *Input will be under 4,000

$r = "I" x <STDIN>;

$r =~ s/I{1000}/M/g;
$r =~ s/I{500}/D/g;
$r =~ s/I{100}/C/g;
$r =~ s/I{50}/L/g;
$r =~ s/I{10}/X/g;
$r =~ s/I{5}/V/g;

$r =~ s/DC{4}/CM/g;
$r =~ s/LX{4}/XC/g;
$r =~ s/VI{4}/IX/g;

$r =~ s/C{4}/CD/g;
$r =~ s/X{4}/XL/g;
$r =~ s/I{4}/IV/g;

print $r;