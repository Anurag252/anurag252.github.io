---
title: "String Compression"
date: "2024-05-13T23:34:20+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 62 ms (29.93%) | Memory: 16.6 MB (80.33%) - LeetSync"
---

```python
class Solution:
    def compress(self, chars: List[str]) -> int:
        curr = 0
        fast = 0

        while(fast < len(chars)) :
            diff = 0
            while( fast < len(chars) and chars[fast] == chars[curr]):
                diff = diff + 1
                fast = fast + 1
            if curr + 1 <= fast and fast < len(chars):
                chars, curr = self.assign(fast, curr , chars, diff)
            if  fast < len(chars):
                curr = curr + 1
                chars[curr] = chars[fast]
        
        #curr = curr + 1
        if curr < len(chars):
            chars, curr = self.assign(fast, curr, chars, diff)
            #chars[curr] = str(fast - curr + 1)
        return curr + 1

    def assign(self, fast : int, curr : int, chars : List[str], diff : int) -> (List[str], int) :
        t = diff
        if t <= 1:
            return chars, curr

        while (len(str(t)) > 1) :
            curr = curr + 1
            chars[curr] = str(t)[0]
            t = str(t)[1:]
        
        curr = curr + 1
        chars[curr] = str(t)
        return chars, curr
```