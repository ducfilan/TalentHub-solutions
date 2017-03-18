sub is_prime {
    $n = shift;
    return 0 if($n==1 || $n==-1 || $n==0);
    ("1" x $n) !~ /^(11+)\1+$/;
}

@list = sort {$a <=> $b} split(' ', <STDIN>);
@missing = map $list[$_-1]+1..$list[$_]-1, 1..@list-1;

$result = -1;
foreach $a (@missing){
    if(is_prime($a)){
        $result = $a;
        last;
    }
}

print $result;