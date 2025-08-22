---
title: "Rotating The Box"
date: "2024-11-23T09:00:19+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 3310 ms (5.06%) | Memory: 28.8 MB (78.97%) - LeetSync"
---

```python
class Solution:
    def rotateTheBox(self, box: List[List[str]]) -> List[List[str]]:
        ans = []
        for rows in box:
            start = 0
            end = len(rows) - 1
            temp = end
            prev = "."
            res = []
            while(temp >= 0):
                if rows[temp] == "#":
                    m = 0
                    while(len(res) > 0 and res[-1] == "."):
                        m += 1
                        res.pop(-1)
                    res.append("#")
                    while(m > 0):
                        res.append(".")
                        m -= 1

                    temp -= 1
                    continue
                if rows[temp] == ".":
                    res.append(".")
                    temp -= 1
                    continue
                if rows[temp] == "*":
                    res.append("*")
                    temp -= 1
                    continue
            # fill empty at end
            #print(res)
            while(len(res) < len(rows)):
                res.append(".")
            # reverse
            res.reverse()
            ans.append(copy.deepcopy(res))
        ans.reverse()
        row = 0
        col = 0
        result = []
        t = []
        #print(ans)
        while(col < len(ans[0])  and row < len(ans)):
            
            if row == len(ans) - 1:
                t.append(ans[row][col])
                col += 1
                row = 0
                result.append(copy.deepcopy(t))
                t = []
                continue
            t.append(ans[row][col])
            #print(t)
            row += 1
        return result

                    
                

        
```