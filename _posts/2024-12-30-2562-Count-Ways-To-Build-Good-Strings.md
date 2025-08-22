---
title: "2562 Count Ways To Build Good Strings"
date: "2024-12-30T09:26:39+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
---


                            ## [Count Ways To Build Good Strings](https://leetcode.com/problems/count-ways-to-build-good-strings) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given the integers zero, one, low, and high, we can construct a string by starting with an empty string, and then at each step perform either of the following:

	Append the character '0' zero times.
	Append the character '1' one times.

This can be performed any number of times.

A **good** string is a string constructed by the above process having a **length** between low and high (**inclusive**).

Return *the number of **different** good strings that can be constructed satisfying these properties.* Since the answer can be large, return it **modulo** 109 + 7.

 

Example 1:

```

**Input:** low = 3, high = 3, zero = 1, one = 1
**Output:** 8
**Explanation:** 
One possible valid good string is "011". 
It can be constructed as follows: "" -> "0" -> "01" -> "011". 
All binary strings from "000" to "111" are good strings in this example.

```

Example 2:

```

**Input:** low = 2, high = 3, zero = 1, one = 2
**Output:** 5
**Explanation:** The good strings are "00", "11", "000", "110", and "011".

```

 

**Constraints:**

	1 <= low <= high <= 105
	1 <= zero, one <= low

                            {% raw %}
                            ```python
                            class Solution:
    def countGoodStrings(self, low: int, high: int, zero: int, one: int) -> int:


        """
        T[j] = 1 + T[j-zero] + T[j-one] if j >= low
             = 0 if j > high
             = T[j-zero] + T[j-one]
        """

        
        T = [0] * (high+1)
        T[zero] += 1
        T[one] += 1

        for i in range(min(zero,one),high+1):
            if i == min(zero,one):
                continue
            if i > high+1:
                T[i] = 0
                continue
            if i >= low+1:
                T[i] += T[i-zero] + T[i-one]
                T[i] = T[i] % (10 ** 9 + 7)
                continue
            T[i] += T[i-zero] + T[i-one]
            T[i] = T[i] % (10 ** 9 + 7)
        return sum(T[low:high+2]) % (10 ** 9 + 7)
            

        @cache
        def recurse(count, l):
            if l > high:
                return 0
            if l >= low:
                return 1 + recurse(count , l + zero) + recurse(count , l + one) 
            return recurse(count , l + zero) + recurse(count , l + one)

        return recurse(0, 0) % (10 ** 9 + 7)
        
                            {% endraw %}
                            