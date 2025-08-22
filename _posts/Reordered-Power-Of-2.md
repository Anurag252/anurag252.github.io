---
title: "Reordered Power Of 2"
date: "2025-08-11T09:30:33+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 4 ms (42.53%) | Memory: 17.8 MB (52.87%) - LeetSync"
---

```python
class Solution:
    def reorderedPowerOf2(self, n: int) -> bool:
        l = list(str(n))
        res = []
        l.sort(key= lambda x : -int(x))
        print(l)
        k = 1
        while(k <= int("".join(l)) ):
            b = list(str(k))
            b.sort(key= lambda x : -int(x))
            if "".join(b) == "".join(l):
                return True
            k *= 2
        return False



        ln = len(str(n))

        def recurse(l):
            if len(l) == 0:
                return []
            if len(l) == 2:
                return [l[0] + l[1], l[1] + l[0]]
            if len(l) == 1:
                return [l[0]]
            res = set()
            for i,k in enumerate(l):
                a = recurse(l[:i])
                b = recurse(l[i+1:])
                print(a,b)
                if len(a) == 0:
                    a.append("")
                if len(b) == 0:
                    b.append("")
                for m in a:
                    for n1 in b:
                        res.add(m + l[i] + n1)
                for m in b:
                    for n1 in a:
                        res.add(m + l[i] + n1)
            print(res)
            return res
        for k in recurse(l):

            if  ln == len(str(int(k))):
                print(k)
                return True
        return False
        


        
```