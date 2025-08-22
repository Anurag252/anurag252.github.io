---
title: "375 Guess Number Higher Or Lower Ii"
date: "2024-05-25T09:28:38+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
---


                            ## [Guess Number Higher or Lower II](https://leetcode.com/problems/guess-number-higher-or-lower-ii) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

We are playing the Guessing Game. The game will work as follows:

	I pick a number between 1 and n.
	You guess a number.
	If you guess the right number, **you win the game**.
	If you guess the wrong number, then I will tell you whether the number I picked is **higher or lower**, and you will continue guessing.
	Every time you guess a wrong number x, you will pay x dollars. If you run out of money, **you lose the game**.

Given a particular n, return *the minimum amount of money you need to **guarantee a win regardless of what number I pick***.

 

Example 1:

![image](https://assets.leetcode.com/uploads/2020/09/10/graph.png)
```

**Input:** n = 10
**Output:** 16
**Explanation:** The winning strategy is as follows:
- The range is [1,10]. Guess 7.
    - If this is my number, your total is $0. Otherwise, you pay $7.
    - If my number is higher, the range is [8,10]. Guess 9.
        - If this is my number, your total is $7. Otherwise, you pay $9.
        - If my number is higher, it must be 10. Guess 10. Your total is $7 + $9 = $16.
        - If my number is lower, it must be 8. Guess 8. Your total is $7 + $9 = $16.
    - If my number is lower, the range is [1,6]. Guess 3.
        - If this is my number, your total is $7. Otherwise, you pay $3.
        - If my number is higher, the range is [4,6]. Guess 5.
            - If this is my number, your total is $7 + $3 = $10. Otherwise, you pay $5.
            - If my number is higher, it must be 6. Guess 6. Your total is $7 + $3 + $5 = $15.
            - If my number is lower, it must be 4. Guess 4. Your total is $7 + $3 + $5 = $15.
        - If my number is lower, the range is [1,2]. Guess 1.
            - If this is my number, your total is $7 + $3 = $10. Otherwise, you pay $1.
            - If my number is higher, it must be 2. Guess 2. Your total is $7 + $3 + $1 = $11.
The worst case in all these scenarios is that you pay $16. Hence, you only need $16 to guarantee a win.

```

Example 2:

```

**Input:** n = 1
**Output:** 0
**Explanation:** There is only one possible number, so you can guess 1 and not have to pay anything.

```

Example 3:

```

**Input:** n = 2
**Output:** 1
**Explanation:** There are two possible numbers, 1 and 2.
- Guess 1.
    - If this is my number, your total is $0. Otherwise, you pay $1.
    - If my number is higher, it must be 2. Guess 2. Your total is $1.
The worst case is that you pay $1.

```

 

**Constraints:**

	1 <= n <= 200

                            {% raw %}
                            ```python
                            class Solution:
    def __init__(self):
        self.cache = {}
    def getMoneyAmount(self, n: int, start : int = 1, end : int = 200) -> int:
        least_amount = 1000000
        key = str(n) + "#" + str(start)
        if key in self.cache:
            return self.cache[key]
        if start > n:
            self.cache[key] = -1
            return -1 # unfavourable guesses
        if start == n:
            self.cache[key] = 0
            return 0 
        if end == 200 :
            end = n
        for k in range(start, n):
            a = self.getMoneyAmount(k-1, start, end)
            b = self.getMoneyAmount(n, k + 1, end)
            if a != -1 and b != -1:
                least_amount = min(least_amount, k + max(a,b))
            elif a != -1:
                least_amount = min(least_amount, k + a)
            elif b != -1:
                least_amount = min(least_amount, k + b)
        self.cache[key] = least_amount
        return least_amount

        
    #min(m + max(   1 to m-1 -> m1, m+1 , n -> m2)) for all m between 1 to n. 





        
                            {% endraw %}
                            