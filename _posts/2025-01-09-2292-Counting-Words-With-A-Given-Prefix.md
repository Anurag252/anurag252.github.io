---
            title: "2292 Counting Words With A Given Prefix"
            date: "2025-01-09T06:45:13+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Counting Words With a Given Prefix](https://leetcode.com/problems/counting-words-with-a-given-prefix) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

You are given an array of strings words and a string pref.

Return *the number of strings in *words* that contain *pref* as a **prefix***.

A **prefix** of a string s is any leading contiguous substring of s.

 

Example 1:

```

**Input:** words = ["pay","**at**tention","practice","**at**tend"], pref = "at"
**Output:** 2
**Explanation:** The 2 strings that contain "at" as a prefix are: "**at**tention" and "**at**tend".

```

Example 2:

```

**Input:** words = ["leetcode","win","loops","success"], pref = "code"
**Output:** 0
**Explanation:** There are no strings that contain "code" as a prefix.

```

 

**Constraints:**

	1 <= words.length <= 100
	1 <= words[i].length, pref.length <= 100
	words[i] and pref consist of lowercase English letters.

{% raw %}
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

        
{% endraw %}
