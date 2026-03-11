---
            title: "1054 Complement Of Base 10 Integer"
            date: "2026-03-11T21:09:31+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Complement of Base 10 Integer](https://leetcode.com/problems/complement-of-base-10-integer) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

The **complement** of an integer is the integer you get when you flip all the 0's to 1's and all the 1's to 0's in its binary representation.

	For example, The integer 5 is "101" in binary and its **complement** is "010" which is the integer 2.

Given an integer n, return *its complement*.

 

Example 1:

```

**Input:** n = 5
**Output:** 2
**Explanation:** 5 is "101" in binary, with complement "010" in binary, which is 2 in base-10.

```

Example 2:

```

**Input:** n = 7
**Output:** 0
**Explanation:** 7 is "111" in binary, with complement "000" in binary, which is 0 in base-10.

```

Example 3:

```

**Input:** n = 10
**Output:** 5
**Explanation:** 10 is "1010" in binary, with complement "0101" in binary, which is 5 in base-10.

```

 

**Constraints:**

	0 <= n < 109

 

**Note:** This question is the same as 476: [https://leetcode.com/problems/number-complement/](https://leetcode.com/problems/number-complement/)

{% raw %}


```python


class Solution:
    def bitwiseComplement(self, n: int) -> int:
        if n == 0:
            return 1
        number_of_bits = 0
        k = n
        while(n > 0):
            n = n >> 1
            number_of_bits += 1
        return pow(2 , number_of_bits) - 1 - k



{% endraw %}
```
