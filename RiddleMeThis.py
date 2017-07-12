# A rich kid just gave a riddle to his classmates, offering big prize for anyone who could solve it. He wrote on a paper an array of N numbers and challenge everyone to find out the perfection of the array, which is defined by the maximum length of consecutive elements of it, given that the difference between any two elements thereof is less than K. He did not aware that one of his classmates, Donald, is a competent coder. With the laptop in hand, Donald decided to take the challenge. Can you figure out how he is going to solve the riddle?

#Input:
#+ The first line contains integers N, K, followed by an array a[i] containing N numbers

#Ouput:
#+ A line specifying the perfection of the array

#Constraints:
#+ n<=1e5, k<=1e9 ;
#+ a[i]<=1e4.

#Sample:

#Input
#5 1
#1 2 3 1 1

#Output
#2

#Explanation:
#In this case, we can only pick the following consecutive elements:
#- from 1st to 2nd
#- from 2nd to 3rd
#- from 4th to 5th
#All of them have length of 2.

import bisect


def insert_sort(l, ele):
    pos = bisect.bisect_left(l, ele)
    l[pos:pos] = [ele]
    return pos


def max_length(s, n, k):
    start_pos = 0
    result = 0
    i = 0
    while True:
        if i == n:
            return result

        l = [s[start_pos]]
        l_pos = [start_pos]

        post_in_l = insert_sort(l, s[start_pos + 1])
        l_pos[post_in_l:post_in_l] = [start_pos + 1]

        i = start_pos + 2

        while i < n:
            if l[-1] - l[0] > k:
                if len(l) - 1 > result:
                    result = len(l) - 1
                start_pos = l_pos[bisect.bisect_left(l, s[i - 1] - k) - 1] + 1
                break
            else:
                pos_in_l = insert_sort(l, s[i])
                l_pos[pos_in_l:pos_in_l] = [i]
                i += 1
        else:
            result = len(l) if len(l) - 1 > result else result


line1 = raw_input().rstrip().split(' ')
N = int(line1[0])
K = int(line1[1])

numbers = map(int, raw_input().split())

print max_length(numbers, N, K)
