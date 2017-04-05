# Given an integer N and a sorted array A of integers, locate the position of N in the array. 
# In the event of N not existing in the array, return the position in which it should be inserted to keep the array sorted.

# Example: 

# Input:
# 8,10,15,16,20,25,29
# 12

# Output:
# 2

sub binary {
    my ($ary, $val) = @_;
	$max = scalar @{$ary};
    while (1) {
        $i = int(($min+$max)/2);
        last if $last == $i;
        $last = $i;
        if ($ary->[$i] == $val) {
            print $i;
            return;
        }
        elsif ($ary->[$i] < $val) {
            $min = $i;
        }
        else {
            $max = $i;
        }
    }
    $i++ if $max;
    print $i;
}

@A = split(/,/, <STDIN>);
$N = <STDIN>;

binary(\@A, $N);