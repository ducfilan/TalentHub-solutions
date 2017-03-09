$line_1 = <STDIN>;
$line_2 = <STDIN>;

@array_1 = split ' ', $line_1;
@array_2 = split ' ', $line_2;

push @array_1, @array_2;
print join ' ', sort {$a <=> $b} @array_1;