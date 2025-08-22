---
title: "Divide Players Into Teams Of Equal Skill"
date: "2024-10-04T21:11:40+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 432 ms (17.70%) | Memory: 31.6 MB (6.90%) - LeetSync"
---

```python
class Solution:
    def dividePlayers(self, skill: List[int]) -> int:
        s = sum(skill)
        each_sum = 2 * (s / len(skill))
        if each_sum  != int(each_sum) :
            return -1
        each_sum = int(each_sum)
        hash = {}

        for idx,k in enumerate(skill):
                if k in hash:
                    hash[k].append(idx)
                else:
                    hash[k] = [idx]
        result = 0
        print(hash, s, each_sum)
        for k,v in hash.items():
            if each_sum - k not in hash:
                return -1
            other_item = hash[each_sum - k]
            
            if each_sum - k == k:
                start = 0
                while(start < len(v)):
                    result += (skill[v[start]] * skill[v[start+1]])
                    start += 2
            else:
                if len(v) != len(other_item):
                    return -1
                for n1, n2 in zip(v, other_item):
                    result += (skill[n1]*skill[n2])
            hash[k] = []
            hash[each_sum - k] = []


        return result
        
```