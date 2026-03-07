---
            title: "2017 Minimum Number Of Flips To Make The Binary String Alternating"
            date: "2026-03-07T21:26:29+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Minimum Number of Flips to Make the Binary String Alternating](https://leetcode.com/problems/minimum-number-of-flips-to-make-the-binary-string-alternating) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a binary string s. You are allowed to perform two types of operations on the string in any sequence:

	**Type-1: Remove** the character at the start of the string s and **append** it to the end of the string.
	**Type-2: Pick** any character in s and **flip** its value, i.e., if its value is '0' it becomes '1' and vice-versa.

Return *the **minimum** number of **type-2** operations you need to perform* *such that *s *becomes **alternating**.*

The string is called **alternating** if no two adjacent characters are equal.

	For example, the strings "010" and "1010" are alternating, while the string "0100" is not.

 

Example 1:

```

**Input:** s = "111000"
**Output:** 2
**Explanation**: Use the first operation two times to make s = "100011".
Then, use the second operation on the third and sixth elements to make s = "101010".

```

Example 2:

```

**Input:** s = "010"
**Output:** 0
**Explanation**: The string is already alternating.

```

Example 3:

```

**Input:** s = "1110"
**Output:** 1
**Explanation**: Use the second operation on the second element to make s = "1010".

```

 

**Constraints:**

	1 <= s.length <= 105
	s[i] is either '0' or '1'.

{% raw %}


```python


class Solution:
    def minFlips(self, s: str) -> int:
        n = len(s)
        t = s + s  # All rotations appear as substrings

        # Build target patterns
        a = "".join("1" if i % 2 == 0 else "0" for i in range(2 * n))
        b = "".join("0" if i % 2 == 0 else "1" for i in range(2 * n))

        # Count mismatches in the initial window [0, n)
        diff_a = sum(t[i] != a[i] for i in range(n))
        diff_b = sum(t[i] != b[i] for i in range(n))

        res = min(diff_a, diff_b)

        # Slide the window across all rotations
        for i in range(n):
            # Add character entering the window (at i + n)
            diff_a += t[i + n] != a[i + n]
            diff_b += t[i + n] != b[i + n]

            # Remove character leaving the window (at i)
            diff_a -= t[i] != a[i]
            diff_b -= t[i] != b[i]

            res = min(res, diff_a, diff_b)

        return res


{% endraw %}
```
