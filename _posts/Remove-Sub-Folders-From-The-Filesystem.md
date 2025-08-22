---
title: "Remove Sub Folders From The Filesystem"
date: "2025-07-19T10:38:27+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 50 ms (65.73%) | Memory: 30.7 MB (60.37%) - LeetSync"
---

```python
class Solution:
    def removeSubfolders(self, folder: List[str]) -> List[str]:
        folder.sort(key=lambda x : len(x))
        mp = set()
        for r in folder:
            f_arr = r.split('/')
            p = ""
            include = True
            for a in f_arr:
                if a == "":
                    continue
                if p + "/" + a in mp:
                    include = False
                    break
                p += "/" + a
            if include:
                mp.add(p)
        return list(mp)





        
```