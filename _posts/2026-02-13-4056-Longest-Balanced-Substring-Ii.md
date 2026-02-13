---
            title: "4056 Longest Balanced Substring Ii"
            date: "2026-02-13T21:24:53+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Longest Balanced Substring II](https://leetcode.com/problems/longest-balanced-substring-ii) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a string s consisting only of the characters 'a', 'b', and 'c'.

A **substring** of s is called **balanced** if all **distinct** characters in the **substring** appear the **same** number of times.

Return the **length of the longest balanced substring** of s.

 

Example 1:

**Input:** s = "abbac"

**Output:** 4

**Explanation:**

The longest balanced substring is "abba" because both distinct characters 'a' and 'b' each appear exactly 2 times.

Example 2:

**Input:** s = "aabcc"

**Output:** 3

**Explanation:**

The longest balanced substring is "abc" because all distinct characters 'a', 'b' and 'c' each appear exactly 1 time.

Example 3:

**Input:** s = "aba"

**Output:** 2

**Explanation:**

One of the longest balanced substrings is "ab" because both distinct characters 'a' and 'b' each appear exactly 1 time. Another longest balanced substring is "ba".

 

**Constraints:**

	1 <= s.length <= 105
	s contains only the characters 'a', 'b', and 'c'.

{% raw %}


```python


class Solution:
    def longestBalanced(self, S: str) -> int:
        N = len(S)
        P = [[0, 0, 0]]
        for c in S:
            P.append(P[-1][:])
            P[-1]["abc".index(c)] += 1

        ans = 0
        first = {}
        for i, (a, b, c) in enumerate(P):
            for key in [
                ("abc", a - b, a - c),
                ("ab", a - b, c),
                ("bc", b - c, a),
                ("ca", c - a, b),
                ("a", b, c),
                ("b", c, a),
                ("c", a, b),
            ]:
                ans = max(ans, i - first.get(key, i))
                first.setdefault(key, i)

        return ans


{% endraw %}
```
