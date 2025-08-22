---
title: "Find Longest Special Substring That Occurs Thrice I"
date: "2024-12-10T08:27:33+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 131 ms (10.27%) | Memory: 17.5 MB (5.52%) - LeetSync"
---

```python
class Solution:
    def maximumLength(self, s: str) -> int:
        freq = [0] * 26
        for k in s:
            freq[ord(k) - 97] += 1
        #print(freq)
        

        @cache
        def find_occur(s1, s2):
            #print(s1, s2)
            for k in s1:
                if k != s1[0]:
                    return 0
            i = 0
            j = 0
            res = 0
            while(i < len(s2)):
                if s2[i] == s1[j]:
                    t1 = i
                    t2 = j
                    while(t1 < len(s2) and t2 < len(s1) and s2[t1] == s1[t2]):
                        t1 += 1
                        t2 += 1
                    if t2 == len(s1):
                        res += 1
                    i += 1
                    j = 0
                else:
                    i += 1
            return res


        i = 0
        ans = -1
        temp = 0
        while(i < len(s)):
            if freq[ord(s[i])-97] >= 3:
                j = i + 1
                while(j <= len(s)):
                    if find_occur(s[i:j], s) >= 3:
                        #print(s[i:j], j - i)
                        temp = j - i
                        j += 1
                    else:
                        break
                if temp > 0:
                    ans = max(ans, temp)
            else:
                if temp > 0:
                    ans = max(ans, temp)
                temp = 0
            i += 1
        return ans 

    #aaaa
```