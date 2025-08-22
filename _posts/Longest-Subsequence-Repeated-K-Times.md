---
title: "Longest Subsequence Repeated K Times"
date: "2025-06-27T23:12:08+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 905 ms (61.27%) | Memory: 18 MB (46.48%) - LeetSync"
---

```python
class Solution:
    def longestSubsequenceRepeatedK(self, s: str, k: int) -> str:
        ans = ""
        candidate = sorted(
            [c for c, w in Counter(s).items() if w >= k], reverse=True
        )
        q = deque(candidate)
        while q:
            curr = q.popleft()
            if len(curr) > len(ans):
                ans = curr
            # generate the next candidate string
            for ch in candidate:
                nxt = curr + ch
                it = iter(s)
                if all(ch in it for ch in nxt * k):
                    q.append(nxt)
        return ans
```