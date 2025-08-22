---
title: "9 Palindrome Number"
date: "2024-05-24T10:09:26+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
---

## [Palindrome Number](https://leetcode.com/problems/palindrome-number) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

Given an integer x, return true* if *x* is a ****palindrome****, and *false* otherwise*.

 

Example 1:

```

**Input:** x = 121
**Output:** true
**Explanation:** 121 reads as 121 from left to right and from right to left.

```

Example 2:

```

**Input:** x = -121
**Output:** false
**Explanation:** From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.

```

Example 3:

```

**Input:** x = 10
**Output:** false
**Explanation:** Reads 01 from right to left. Therefore it is not a palindrome.

```

 

**Constraints:**

	-231 <= x <= 231 - 1

 

**Follow up:** Could you solve it without converting the integer to a string?

```python
class Solution:
    def isPalindrome(self, x: int) -> bool:
        if x < 0 or x != ceil(x):
            return False
        if x == 0:
            return True
        inverted_num = 0
        orig = x
        m = 1
        n = pow(10,int(log(x,10)))
        while(x >= 0 and n >= 1):
            
            l = int(x / n)
            print(l,inverted_num, n,m,x)
            inverted_num = inverted_num + l*m
            x = int(x % n)
            n = int(n / 10)
            m = m * 10
        return inverted_num == orig



        
```