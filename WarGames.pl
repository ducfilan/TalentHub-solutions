$N = <STDIN>;

for ( $i = 0; $i < $N; $i++) {
  $l = <STDIN>;
  chomp($l);
  @l = split(' ', $l);
  
  $R[$i] = $l[0];
  $C[$i] = $l[1];
}

@R = sort {$a <=> $b} @R;
@C = sort  {$a <=> $b} @C;

$m = 0;

for ( $j = 1; $j <= $N; $j++) {
  $m += abs($R[$j - 1] - $j) + abs($C[$j - 1] - $j);
}

print $m;