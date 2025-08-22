---
title: "Split A String Into The Max Number Of Unique Substrings"
date: "2024-10-21T07:37:41+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 263 ms (12.33%) | Memory: 16.7 MB (19.96%) - LeetSync"
---

```python
class Solution:
    def maxUniqueSplit(self, s: str) -> int:

        k = set()
        def split_substr(s, i ):
           
            if i > len(s):
                return 0
            #print(s[i:])
            result = 0
            for m in range(i, len(s)+1):
                
                if len(s[i:m]) > 0 and s[i:m] not in k:
                    k.add(s[i:m])
                    result = max(result, 1 + split_substr(s, m))
                    k.remove(s[i:m])
            return result
        return split_substr(s,0)


        
```