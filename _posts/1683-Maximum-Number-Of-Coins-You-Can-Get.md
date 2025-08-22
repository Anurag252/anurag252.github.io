---
title: "1683 Maximum Number Of Coins You Can Get"
date: "2024-05-28T09:20:10+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Maximum Number of Coins You Can Get](https://leetcode.com/problems/maximum-number-of-coins-you-can-get) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)
  
  There are 3n piles of coins of varying size, you and your friends will take piles of coins as follows:
  
  	In each step, you will choose **any **3 piles of coins (not necessarily consecutive).
  	Of your choice, Alice will pick the pile with the maximum number of coins.
  	You will pick the next pile with the maximum number of coins.
  	Your friend Bob will pick the last pile.
  	Repeat until there are no more piles of coins.
  
  Given an array of integers piles where piles[i] is the number of coins in the ith pile.
  
  Return the maximum number of coins that you can have.
  
  &nbsp;
  
  Example 1:
  
  ```
  
  **Input:** piles = [2,4,1,2,7,8]
  **Output:** 9
  **Explanation: **Choose the triplet (2, 7, 8), Alice Pick the pile with 8 coins, you the pile with **7** coins and Bob the last one.
  Choose the triplet (1, 2, 4), Alice Pick the pile with 4 coins, you the pile with **2** coins and Bob the last one.
  The maximum number of coins which you can have are: 7 + 2 = 9.
  On the other hand if we choose this arrangement (1, **2**, 8), (2, **4**, 7) you only get 2 + 4 = 6 coins which is not optimal.
  
  ```
  
  Example 2:
  
  ```
  
  **Input:** piles = [2,4,5]
  **Output:** 4
  
  ```
  
  Example 3:
  
  ```
  
  **Input:** piles = [9,8,7,6,5,1,2,3,4]
  **Output:** 18
  
  ```
  
  &nbsp;
  
  **Constraints:**
  
  	3 &lt;= piles.length &lt;= 105
  	piles.length % 3 == 0
  	1 &lt;= piles[i] &lt;= 104
---

```python
class Solution:
    import heapq 
    def maxCoins(self, piles: List[int]) -> int:
        #1,3,
        n = int(len(piles)/3)
        piles.sort(reverse=True)
        total = 0
        k = 1
        while k < 3*n - n:
            total = total + piles[k]
            k = k + 2


        return total





        
```