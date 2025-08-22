---
            title: "2998 Count Symmetric Integers"
            date: "2025-04-12T04:15:23+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
            ---
            

            ## [  Count Symmetric Integers](https://leetcode.com/problems/count-symmetric-integers) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

You are given two positive integers low and high.

An integer x consisting of 2 * n digits is **symmetric** if the sum of the first n digits of x is equal to the sum of the last n digits of x. Numbers with an odd number of digits are never symmetric.

Return *the **number of symmetric** integers in the range* [low, high].

 

Example 1:

```

**Input:** low = 1, high = 100
**Output:** 9
**Explanation:** There are 9 symmetric integers between 1 and 100: 11, 22, 33, 44, 55, 66, 77, 88, and 99.

```

Example 2:

```

**Input:** low = 1200, high = 1230
**Output:** 4
**Explanation:** There are 4 symmetric integers between 1200 and 1230: 1203, 1212, 1221, and 1230.

```

 

**Constraints:**

	1 <= low <= high <= 104

            {% raw %}
            ```python
            class Solution:
    def countSymmetricIntegers(self, low: int, high: int) -> int:
        res = 0
        for k in range(low, high + 1):
            m = str(k)
            if len(m) % 2 != 0:
                continue
            a = m[0:len(m)//2]
            b = m[len(m)//2:]
            s1, s2 = 0,0
            for p in a:
                s1 += int(p)
            for p in b:
                s2 += int(p)
            if s1 == s2:
                res += 1

        return res
        
            {% endraw %}
            