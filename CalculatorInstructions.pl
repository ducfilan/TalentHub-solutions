# The 'Calculator Instructions' are a string of numbers and mathematical symbols divided by a single space.
# The instructions are read from left to right and start with 2 numbers followed by a mathematical symbol (+, -, * or /).
# The mathematical symbol is applied to the number before the symbol.
# 
# 
# Instructions are strictly processed from left to right (no "order of operation rule").
# For example 2 3 * 1 + 7 / translates to ((2 * 3) + 1) / 7.
# 
# The instruction string ends with a mathematical symbol followed by a newline character.
# 
# Example: 
# Input
# 2 3 * 1 + 
# 
# Output
# 7

my $op_dispatch_table = {
   '+' => sub {
      my ($stack) = @_;
      push @$stack, pop(@$stack) + pop(@$stack);
   },
   '-' => sub {
      my ($stack) = @_;
      my $s = pop(@$stack);
      push @$stack, pop(@$stack) - $s;
   },
   '*' => sub {
      my ($stack) = @_;
      push @$stack, pop(@$stack) * pop(@$stack);
   },
   '/' => sub {
      my ($stack) = @_;
      my $s = pop(@$stack);
      push @$stack, pop(@$stack) / $s;
   },
   'sqrt' => sub {
      my $stack = shift;
      push @$stack, sqrt(pop(@$stack));
   },
};

$input = <STDIN>;

print evaluate($op_dispatch_table, $input);

sub evaluate {
   my $odt = shift;
   my @stack;
   my ($expr) = @_;
   my @tokens = split /\s+/, $expr;
   for my $token (@tokens) {
      if ($token =~ /\d+$/) {
         push @stack, $token;
      } else {
         my $fn = $odt->{$token};
         $fn->(\@stack);
      }

   }
  return pop(@stack);
}