---
title: "3491 Find The Maximum Length Of Valid Subsequence Ii"
date: "2025-07-17T14:56:59+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
---

## [Find the Maximum Length of Valid Subsequence II](https://leetcode.com/problems/find-the-maximum-length-of-valid-subsequence-ii) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)You are given an integer array nums and a **positive** integer k.

A subsequence sub of nums with length x is called **valid** if it satisfies:

	(sub[0] + sub[1]) % k == (sub[1] + sub[2]) % k == ... == (sub[x - 2] + sub[x - 1]) % k.

Return the length of the **longest** **valid** subsequence of nums.

 

Example 1:

**Input:** nums = [1,2,3,4,5], k = 2

**Output:** 5

**Explanation:**

The longest valid subsequence is [1, 2, 3, 4, 5].

Example 2:

**Input:** nums = [1,4,2,3,1,4], k = 3

**Output:** 4

**Explanation:**

The longest valid subsequence is [1, 4, 1, 4].

 

**Constraints:**

	2 <= nums.length <= 103
	1 <= nums[i] <= 107
	1 <= k <= 103

```python
class Solution:
    def maximumLength(self, nums: List[int], k: int) -> int:
        """
        T[n] = max(T[n-i] + 1)  if (a[i] + a[n-i]) % k == v[n-i]

        we can use map somehow to find condition in above statement
        say a number a[i] % k = l
        and in map we need to find v[n-i] - l version.
        The problem arises that we still need to scan twice


        another approach is reduce all by dividing with k so evenry number is < k
        now if a[i] and a[j]  will have remainder as a[i] + a[j]

        basically since k < 1000, take ana rray of size 1000, and at event element store the size ,
        another array to store the original a[i] % k, now loop over all and find out  largest[orig[i] + curr % k] value so that it is max. 


        we need to store the end index of subsequence in original[i] where i is the sum module we are trying to create , 
        then loop over all m in nums
        and for each m , loop over original and find index such that i = (m1 + nums[original[i]])% k
        if yes then original[i] = this index
        and len also inc by 1
        """


        # lets try dp first T[n] = max(T[n-i] + 1)  if (a[i] + a[n-i]) % k == v[n-i] 
        # here v[n-i] also needs updation which is problamatic
        # it stores that at index n-i, the value of the running mod , 
        # we see that single dp is not sufficinet bcoz a,b ....c here c can form multiple mod sums
        # and we must compare all mod sums - a + c, b + c ...
        # so we store T[i][mod] = max(T[j][mod]) max value



        T = [[0 for _ in range(k)] for _ in range(len(nums))]


        
        count = 0
        for i in range(len(T)):
            for m in range(i):
                temp = 2
                mod = (nums[i] + nums[m]) % k
                if T[m][mod] > 0:
                    temp = max(temp, T[m][mod] + 1)
                    T[i][mod] = temp
                else:
                    T[i][mod] = 2
            count = max(count, max(T[i]))
        return count



            




        original = [(-1,0)] * k

        for j, m in enumerate(nums):
            original[m%k] = (j if original[m%k][0] == -1 else original[m%k][0], 1 if original[m%k][1] == 0 else original[m%k][1])

        for j, m in enumerate(nums):
            for i, n in enumerate(original):
                if (m % k + nums[original[i][0]] % k) % k == i: # we have a match
                    print("here")
                    original[i] = (j , original[i][1] + 1)
        result = 0
        print(original)
        for (m,n) in original:
            result = max(result, n)
        return result


        
                




```