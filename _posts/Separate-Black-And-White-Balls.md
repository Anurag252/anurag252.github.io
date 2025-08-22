---
title: "Separate Black And White Balls"
date: "2024-10-15T08:55:17+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 189 ms (7.46%) | Memory: 18.9 MB (10.45%) - LeetSync"
---

```python
class Solution:
    def minimumSteps(self, s: str) -> int:

        arr = list(map(int, s))

        #print(arr)
        result = 0
        j = len(arr) - 1

        while(j >= 0 and arr[j] == 1):
                j -= 1
        # off by 1
        j += 1
        
        temp = j-1
        occ = 0
        count = 0
        while(temp >= 0):
            if arr[temp] == 1:
                result += (count - occ)
                occ += 1
            temp -= 1
            
            count += 1
        return result

        
        
#result += (pos - occ - 1)

        '''
        00000 101010 11111 011010
              101001
              100011

1 + 4-1-1 + 6-2-1

              101001
              100101
              100011
              010011
              001011
              000111

              000111
        101
        011
        10 -> 01
        01 
        110 -> 101, 011
        '''
        
```