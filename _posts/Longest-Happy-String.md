---
title: "Longest Happy String"
date: "2024-10-16T08:34:31+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 45 ms (5.69%) | Memory: 16.8 MB (29.54%) - LeetSync"
---

```python
class Solution:
    def longestDiverseString(self, a: int, b: int, c: int) -> str:



        def test(a,b,c, d):
            if (a == 0 and b == 0 and d == "c") or (b == 0 and c == 0 and d == "a") or (c== 0 and a == 0 and d == "b"):
                return ""


            arr = [(a, "a"),(b, "b"),(c, "c")]
            arr.sort(key = lambda x : x[0])

            (k,l) = arr[2] if d != arr[2][1] else arr[1]
            is_max = True
            if k != arr[2][0]:
                is_max = False

            #print(arr,d)

            if l == "a" :
                if is_max:
                    return "a"*min(2,k) + test(a - min(2,k) , b, c, "a")
                else:
                    return "a" + test(a - 1 , b, c, "a")


            if l == "b":
                if is_max:
                    return "b"*min(2,k) + test(a  , b - min(2,k), c, "b")
                else:
                    return "b" + test(a  , b - 1, c, "b")


            if l == "c":
                if is_max:
                    return "c"*min(2,k) + test(a  , b, c - min(2,k), "c")
                else:
                    return "c" + test(a  , b, c - 1, "c")

        return test(a,b,c, "")
            
        '''
        3,3,3
        aacbbccba
        bbccbc
        aabaccbcb
        '''
        
```