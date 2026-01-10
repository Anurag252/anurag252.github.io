---
            title: "712 Minimum Ascii Delete Sum For Two Strings"
            date: "2026-01-10T22:11:43+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Minimum ASCII Delete Sum for Two Strings](https://leetcode.com/problems/minimum-ascii-delete-sum-for-two-strings) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given two strings s1 and s2, return *the lowest **ASCII** sum of deleted characters to make two strings equal*.

 

Example 1:

```

**Input:** s1 = "sea", s2 = "eat"
**Output:** 231
**Explanation:** Deleting "s" from "sea" adds the ASCII value of "s" (115) to the sum.
Deleting "t" from "eat" adds 116 to the sum.
At the end, both strings are equal, and 115 + 116 = 231 is the minimum sum possible to achieve this.

```

Example 2:

```

**Input:** s1 = "delete", s2 = "leet"
**Output:** 403
**Explanation:** Deleting "dee" from "delete" to turn the string into "let",
adds 100[d] + 101[e] + 101[e] to the sum.
Deleting "e" from "leet" adds 101[e] to the sum.
At the end, both strings are equal to "let", and the answer is 100+101+101+101 = 403.
If instead we turned both strings into "lee" or "eet", we would get answers of 433 or 417, which are higher.

```

 

**Constraints:**

	1 <= s1.length, s2.length <= 1000
	s1 and s2 consist of lowercase English letters.

{% raw %}


```python


class Solution:
    def minimumDeleteSum(self, s1: str, s2: str) -> int:
        res = 0
        # order matters
        # if char does not exists then we must delete 
        # if it occurs at multiple places we must backtrack to find which eads to same str
        # since asciss sum means same chars , no need to look for smallest chars
        @cache
        def recurse(s1, s2,  i, j):
            if i == len(s1) and j == len(s2):
                return 0
            if i == len(s1):
                res = 0
                for k in s2[j:]:
                    res += ord(k)
                return res
            if j == len(s2):
                res = 0
                for k in s1[i:]:
                    res += ord(k)
                return res
            if s1[i:] == s2[j:]:
                return 0
            if s1[i] == s2[j]:
                return recurse(s1, s2, i + 1, j + 1)
            else:
                return min(ord(s1[i]) + recurse(s1, s2, i + 1, j) , ord(s2[j]) + recurse(s1, s2, i , j + 1))

        return recurse(s1, s2, 0, 0)


{% endraw %}
```
