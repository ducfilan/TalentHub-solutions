using System;
namespace Solution
{
    class Solution
    {
        static void Main(string[] args)
        {
            // Input getting.
            var input = Console.ReadLine().Trim().Split(' ');
            var N = int.Parse(input[0]);
            var C = int.Parse(input[1]);
            
            // Declarations.
            const int divisor = 1000000007;
            var pairs = new long[2, 10001];

            // Processing.
            pairs[0, 0] = 1L;
            for (int i = 1, u = 0; i < N; ++i)
            {
                u = Math.Min(u + i, C);

                var remain = 0L;
                for (var j = 0; j <= u; j++)
                {
                    remain = (remain + pairs[1 ^ i & 1, j]) % divisor;
                    pairs[i & 1, j] = remain;

                    if (j >= i)
                    {
                        remain = (remain - pairs[1 ^ i & 1, j - i] + divisor) % divisor;
                    }
                }
            }

            Console.WriteLine(pairs[1 ^ N & 1, C]);
        }
    }
}
