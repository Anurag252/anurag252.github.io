---
title: "Extra Characters In A String"
date: "2024-09-23T22:10:42+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 207 ms (50.18%) | Memory: 17.1 MB (45.99%) - LeetSync"
---

```python
class Solution:
    def minExtraChar(self, s: str, dictionary: List[str]) -> int:
        n, dictionary_set = len(s), set(dictionary)
        @cache
        def dp(start):
            if start == n:
                return 0
            # To count this character as a left over character 
            # move to index 'start + 1'
            ans = dp(start + 1) + 1
            for end in range(start, n):
                curr = s[start: end + 1]
                if curr in dictionary_set:
                    ans = min(ans, dp(end + 1))
            return ans
            
        return dp(0)
```