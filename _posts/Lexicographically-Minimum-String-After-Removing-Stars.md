---
title: "Lexicographically Minimum String After Removing Stars"
date: "2025-06-07T22:22:04+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 5814 ms (5.19%) | Memory: 23.6 MB (60.39%) - LeetSync"
---

```python
class Solution:
    def clearStars(self, s: str) -> str:
        arr = [0] * 26
        mp = {}
        st =[]
        for k in s:
            if k == "*":
                to_be_removed = ""
                for i, a in enumerate(arr):
                    if a > 0:
                        arr[i] -= 1
                        to_be_removed = chr(i + 97)
                        break
                
                index = mp[to_be_removed][-1]
                st[index] = "#"
                if len(mp[to_be_removed][:-1]) == 0:
                    del mp[to_be_removed]
                else:
                    mp[to_be_removed] = mp[to_be_removed][:-1]
                #print(st,mp, to_be_removed)
            else:
                st.append(k)
                if k in mp:
                    mp[k].append(len(st)-1)
                else:
                    mp[k] = [len(st)-1]
                #print(ord(k)-97)
                arr[ord(k)-97] += 1
        res = ""
        for k in st:
            if k != "#":
                res += k

        return res


        
```