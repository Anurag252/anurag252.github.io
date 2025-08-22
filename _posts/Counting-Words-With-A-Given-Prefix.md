---
title: "Counting Words With A Given Prefix"
date: "2025-01-09T06:45:13+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 83 ms (5.73%) | Memory: 18.9 MB (9.54%) - LeetSync"
---

```python
class Trie:
    def __init__(self):
        self.dict = {}

    def insert_traverse(self, root,  a):
        if len(a) == 0:
            return
        if a[0] in root:
            root[a[0]] = (root[a[0]][0], root[a[0]][1] + 1)
            self.insert_traverse(root[a[0]][0], a[1:])
        else:
            root[a[0]] = ({}, 1)
            self.insert_traverse(root[a[0]][0], a[1:])
            

    def insert(self, a):
        root = self.dict
        self.insert_traverse(root, a)

    def traverse(self, root, a):
        if len(a) == 1:
            return root[a][1] if a in root else 0
        if a[0] in root:
            return self.traverse(root[a[0]][0], a[1:])
        else:
            return 0

    def find(self, a):
        root = self.dict
        return self.traverse(root, a)

class Solution:
    def prefixCount(self, words: List[str], pref: str) -> int:
        t = Trie()
        for k in words:
            t.insert(k)

        return t.find(pref)

        
```