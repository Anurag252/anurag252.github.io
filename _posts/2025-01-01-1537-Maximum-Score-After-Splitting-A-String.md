---
            title: "1537 Maximum Score After Splitting A String"
            date: "2025-01-01T08:36:58+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Maximum Score After Splitting a String](https://leetcode.com/problems/maximum-score-after-splitting-a-string) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

Given a string s of zeros and ones, *return the maximum score after splitting the string into two **non-empty** substrings* (i.e. **left** substring and **right** substring).

The score after splitting a string is the number of **zeros** in the **left** substring plus the number of **ones** in the **right** substring.

 

Example 1:

```

**Input:** s = "011101"
**Output:** 5 
**Explanation:** 
All possible ways of splitting s into two non-empty substrings are:
left = "0" and right = "11101", score = 1 + 4 = 5 
left = "01" and right = "1101", score = 1 + 3 = 4 
left = "011" and right = "101", score = 1 + 2 = 3 
left = "0111" and right = "01", score = 1 + 1 = 2 
left = "01110" and right = "1", score = 2 + 1 = 3

```

Example 2:

```

**Input:** s = "00111"
**Output:** 5
**Explanation:** When left = "00" and right = "111", we get the maximum score = 2 + 3 = 5

```

Example 3:

```

**Input:** s = "1111"
**Output:** 3

```

 

**Constraints:**

	2 <= s.length <= 500
	The string s consists of characters '0' and '1' only.

{% raw %}


````python


class Solution:
    def maxScore(self, s: str) -> int:
        res = 0
        left = []
        right = []
        temp0 = 0
        temp1 = 0
        for k in s:
            if k == "0":
                temp0 += 1
            left.append(temp0)
            if k == "1":
                temp1 += 1
            right.append(temp1)


        for idx, (k1, k2) in enumerate(zip(left, right)):
            if idx == len(right)-1:
                continue
            res = max(res, k1 + right[-1] - right[idx])
        return res



        


{% endraw %}
