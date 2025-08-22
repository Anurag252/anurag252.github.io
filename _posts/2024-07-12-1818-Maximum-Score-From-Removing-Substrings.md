---
            title: "1818 Maximum Score From Removing Substrings"
            date: "2024-07-12T10:52:02+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Maximum Score From Removing Substrings](https://leetcode.com/problems/maximum-score-from-removing-substrings) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a string s and two integers x and y. You can perform two types of operations any number of times.

	Remove substring "ab" and gain x points.

		For example, when removing "ab" from "cabxbae" it becomes "cxbae".

	Remove substring "ba" and gain y points.

		For example, when removing "ba" from "cabxbae" it becomes "cabxe".

Return *the maximum points you can gain after applying the above operations on* s.

 

Example 1:

```

**Input:** s = "cdbcbbaaabab", x = 4, y = 5
**Output:** 19
**Explanation:**
- Remove the "ba" underlined in "cdbcbbaaabab". Now, s = "cdbcbbaaab" and 5 points are added to the score.
- Remove the "ab" underlined in "cdbcbbaaab". Now, s = "cdbcbbaa" and 4 points are added to the score.
- Remove the "ba" underlined in "cdbcbbaa". Now, s = "cdbcba" and 5 points are added to the score.
- Remove the "ba" underlined in "cdbcba". Now, s = "cdbc" and 5 points are added to the score.
Total score = 5 + 4 + 5 + 5 = 19.
```

Example 2:

```

**Input:** s = "aabbaaxybbaabb", x = 5, y = 4
**Output:** 20

```

 

**Constraints:**

	1 <= s.length <= 105
	1 <= x, y <= 104
	s consists of lowercase English letters.

{% raw %}
```python
class Solution:
    def maximumGain(self, s: str, x: int, y: int) -> int:
        i = 0
        first = ""
        second = ""
        diff1 = 0
        diff2 = 0
        result = 0
        if x > y:
            first = "ab"
            second = "ba"
            diff1 = x
            diff2 = y
        else:
            first = "ba"
            second = "ab"
            diff1 = y
            diff2 = x
        
        stack = []

        while(i < len(s)):
            stack.append(s[i])
            if len(stack) > 1 and str(stack[-2] + stack[-1]) == first:
                result += diff1
                del stack[-1]
                del stack[-1]
            i = i + 1
        #print(''.join(stack), result)
        s = ''.join(stack)
        stack=[]
        i = 0
        while(i < len(s)):
            stack.append(s[i])
            if len(stack) > 1 and str(stack[-2] + stack[-1]) == second:
                result += diff2
                del stack[-1]
                del stack[-1]
            i = i + 1
                
        return result
# aaa ab bbb -> due to this a new string to be created again 2nsd time



        
        
{% endraw %}
