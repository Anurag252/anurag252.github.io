---
title: "797 Rabbits In Forest"
date: "2025-04-21T06:06:59+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Rabbits in Forest](https://leetcode.com/problems/rabbits-in-forest) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)
  
  There is a forest with an unknown number of rabbits. We asked n rabbits **\"How many rabbits have the same color as you?\"** and collected the answers in an integer array answers where answers[i] is the answer of the ith rabbit.
  
  Given the array answers, return *the minimum number of rabbits that could be in the forest*.
  
   
  
  Example 1:
  
  ```
  
  **Input:** answers = [1,1,2]
  **Output:** 5
  **Explanation:**
  The two rabbits that answered \"1\" could both be the same color, say red.
  The rabbit that answered \"2\" can't be red or the answers would be inconsistent.
  Say the rabbit that answered \"2\" was blue.
  Then there should be 2 other blue rabbits in the forest that didn't answer into the array.
  The smallest possible number of rabbits in the forest is therefore 5: 3 that answered plus 2 that didn't.
  
  ```
  
  Example 2:
  
  ```
  
  **Input:** answers = [10,10,10]
  **Output:** 11
  
  ```
  
   
  
  **Constraints:**
  
  	1 <= answers.length <= 1000
  	0 <= answers[i] < 1000
---

```python
class Solution:
    def numRabbits(self, answers: List[int]) -> int:
        # if all different then just sum all plus one each
        # if two same - then same ones can be of same color 
        # so ans[i] + 1, and ignore ans[j] 
        # but if same ones are more than ans[i] + 1, means
        # we have more than one colors 
        # so ignore only ans[i] + 1
        res = 0
        s = {}

        for k in answers:
                if k in s:
                    s[k] += 1
                else:
                    s[k] = 1

        for k in s:
            v = s[k]
            while(v > 0):
                res += k+1
                v -= (k+1)
        return res

        
```