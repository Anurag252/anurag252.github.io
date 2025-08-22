---
title: "Construct String With Repeat Limit"
date: "2024-12-17T08:51:50+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 483 ms (11.96%) | Memory: 19.1 MB (40.21%) - LeetSync"
---

```python
class Solution:
    def repeatLimitedString(self, s: str, repeatLimit: int) -> str:
        freq = {}
        h = []



        for k in s:
            if k in freq:
                freq[k] += 1
            else:
                freq[k] = 1

        for k in freq.keys():
            heapq.heappush(h, -(ord(k)))

        prev = -1
        ls = []
        while(h):
            item1 = -heapq.heappop(h)
            if item1 == prev and h:
                item2 = -heapq.heappop(h)
                heapq.heappush(h, -item1) # push back item1

                prev = item2
                ls.append(chr(item2))
                freq[chr(item2)] -= 1
                if freq[chr(item2)] > 0:
                    heapq.heappush(h, -item2) # push next char just once


            elif item1 != prev:
                t = 0
                prev = item1
                while t < min(repeatLimit,freq[chr(item1)] ):
                    ls.append(chr(item1))
                    t += 1
                freq[chr(item1)] -= t
                if freq[chr(item1)] > 0:
                    heapq.heappush(h, -item1)
            else:
                break
        return "".join(ls)

            



        

        
```