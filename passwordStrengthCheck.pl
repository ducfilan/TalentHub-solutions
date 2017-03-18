$a=<STDIN>;
$c=1;
$c-- if($a=~/(.)\1{2}/);
$c++ if($a=~/[a-z]/);
$c++ if($a=~/[A-Z]/);
$c++ if($a=~/\d/);
$c++ if($a=~/[!@#&*]/);
$c++ if($a=~/.{7,}/);
print $c<4?'Weak':$c<6?'Medium':'Strong';