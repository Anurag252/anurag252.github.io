---
title: "Sum Game"
date: "2024-05-23T18:26:13+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 118 ms (41.51%) | Memory: 17.7 MB (36.79%) - LeetSync"
---

```python
class Solution:
    def sumGame(self, num: str) -> bool:
        half_length = int(len(num)/2) # len is always even
        count_of_unknowns_left = 0
        count_of_unknowns_right = 0
        count_of_unknown = -1
        for k in num[:half_length]:
            if k == "?":
                count_of_unknowns_left = count_of_unknowns_left + 1

        for k in num[half_length:]:
            if k == "?":
                count_of_unknowns_right = count_of_unknowns_right + 1

        
        
        
        diff_sum = -1
        
        lhs = self.calculate_sum(num[:half_length])
        rhs = self.calculate_sum(num[half_length:])
        if lhs == rhs and count_of_unknowns_right == count_of_unknowns_left:
            return False #bob wins 
        
        if abs(count_of_unknowns_right - count_of_unknowns_left) % 2 == 1:
            return True # alice always wins

        if lhs > rhs and count_of_unknowns_right > count_of_unknowns_left:
            diff_sum = lhs-rhs
            count_of_unknown = count_of_unknowns_right - count_of_unknowns_left

        if lhs < rhs and count_of_unknowns_right < count_of_unknowns_left:
            diff_sum = rhs-lhs
            count_of_unknown =  count_of_unknowns_left - count_of_unknowns_right
        print(diff_sum, count_of_unknown)
        if diff_sum > 0 and count_of_unknown > 0:
            return int((count_of_unknown + 1)/2) * 9 > diff_sum or  int((count_of_unknown)/2) * 9 < diff_sum# >= for 9? test case
        
        return True # alice always wins
        

    def calculate_sum(self, nums : str) -> int:
        print(nums)
        sum = 0
        for k in nums:
            if k != "?":
                sum = sum + int(k)
        return sum

#?329 5???

#14 = 2?
#x + y = 14
#sum(x) + sum(y) = k
#sum(x) > k // alice wins
#sum(x) < k for all x between 0 to 9 then bob wins
#num+1/2 

```