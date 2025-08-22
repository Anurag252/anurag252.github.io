---
title: "780 Max Chunks To Make Sorted"
date: "2024-12-19T18:14:21+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Max Chunks To Make Sorted](https://leetcode.com/problems/max-chunks-to-make-sorted) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)
  
  You are given an integer array arr of length n that represents a permutation of the integers in the range [0, n - 1].
  
  We split arr into some number of **chunks** (i.e., partitions), and individually sort each chunk. After concatenating them, the result should equal the sorted array.
  
  Return *the largest number of chunks we can make to sort the array*.
  
  &nbsp;
  
  Example 1:
  
  ```
  
  **Input:** arr = [4,3,2,1,0]
  **Output:** 1
  **Explanation:**
  Splitting into two or more chunks will not return the required result.
  For example, splitting into [4, 3], [2, 1, 0] will result in [3, 4, 0, 1, 2], which isn't sorted.
  
  ```
  
  Example 2:
  
  ```
  
  **Input:** arr = [1,0,2,3,4]
  **Output:** 4
  **Explanation:**
  We can split into two chunks, such as [1, 0], [2, 3, 4].
  However, splitting into [1, 0], [2], [3], [4] is the highest number of chunks possible.
  
  ```
  
  &nbsp;
  
  **Constraints:**
  
  	n == arr.length
  	1 &lt;= n &lt;= 10
  	0 &lt;= arr[i] &lt; n
  	All the elements of arr are **unique**.
---

```python
class Solution:
    def maxChunksToSorted(self, arr: List[int]) -> int:

        def partition(arr):
            arr1 = copy.deepcopy(arr)
            arr1.sort()
            if len(arr) == 0:
                return (0, arr)
            if len(arr) == 1:
                return (1, arr)
            
            result = 1
            

            for idx, k in enumerate(arr):
                if len(arr[0:idx+1]) == 0 or len(arr[idx+1:]) == 0:
                    continue
                
                a,b = partition(arr[0:idx+1])
                c,d = partition(arr[idx+1:])
                if b + d == arr1 :
                    #print(arr1, a,c)
                    result = max(result,a + c)
            return (result, arr1)
        return partition(arr)[0]


        
```