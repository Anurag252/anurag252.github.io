---
title: "Filling Bookcase Shelves"
date: "2024-07-31T18:39:41+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 504 ms (5.08%) | Memory: 26.9 MB (5.93%) - LeetSync"
---

```python
class Solution:
    def __init__(self):
        self.a = {}
    def minHeightShelves(self, books: List[List[int]], shelfWidth: int) -> int:
        
        r = "".join(str(books))
        if r in self.a:
            return self.a[r]
        total = 0
        t = []
        result = 1000000
        i = 0
        for k in books:
            
            if total + k[0] <= shelfWidth:
                t.append(k[1])
                total += k[0]
                result = min(result, max(t) +  self.minHeightShelves( books[i+1:], shelfWidth))
            else:
                break
            i += 1
        #print(books, result)
        self.a[r] = 0 if result == 1000000 else result
        return self.a[r]

            


        
```