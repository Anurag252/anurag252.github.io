---
title: "633 Sum Of Square Numbers"
date: "2024-06-17T14:46:55+02:00"
categories: ["leetcode"]
tags: [c]
layout: post
---


                            ## [Sum of Square Numbers](https://leetcode.com/problems/sum-of-square-numbers) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given a non-negative integer c, decide whether there're two integers a and b such that a2 + b2 = c.

 

Example 1:

```

**Input:** c = 5
**Output:** true
**Explanation:** 1 * 1 + 2 * 2 = 5

```

Example 2:

```

**Input:** c = 3
**Output:** false

```

 

**Constraints:**

	0 <= c <= 231 - 1

                            {% raw %}
                            ```c
                            bool judgeSquareSum(int c) {
    if (c == 0) {
        return true;
    }
    for (int i = 1 ; i <= (int)(sqrt(c)) ; i ++) {
        double k = sqrt(c- i*i);
        if ((int)(k) == k) {
            //printf(" %d %d\n",k, i);
            return true;
        }
    }
    return false;
    
}
                            {% endraw %}
                            