---
            title: "812 Rotate String"
            date: "2024-11-03T10:00:15+05:30"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Rotate String](https://leetcode.com/problems/rotate-string) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

Given two strings s and goal, return true *if and only if* s *can become* goal *after some number of **shifts** on* s.

A **shift** on s consists of moving the leftmost character of s to the rightmost position.

	For example, if s = "abcde", then it will be "bcdea" after one shift.

 

Example 1:

```
**Input:** s = "abcde", goal = "cdeab"
**Output:** true

```

Example 2:

```
**Input:** s = "abcde", goal = "abced"
**Output:** false

```

 

**Constraints:**

	1 <= s.length, goal.length <= 100
	s and goal consist of lowercase English letters.

{% raw %}
```python
class Solution:
    def rotateString(self, s: str, goal: str) -> bool:
        

        for idx, k in enumerate(s):
            if (s[idx:] + s[:idx]) == goal:
                return True
        return False
{% endraw %}
