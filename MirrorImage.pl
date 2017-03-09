$i=<STDIN>;

$x=reverse $i;

if($i=~/^-/){
    print '-';
}

print int($x);
