---
title: "./464 Can I Win"
date: "2024-05-26T15:48:42+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/can-i-win">Can I Win</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>In the &quot;100 game&quot; two players take turns adding, to a running total, any integer from <code>1</code> to <code>10</code>. The player who first causes the running total to <strong>reach or exceed</strong> 100 wins.</p>

<p>What if we change the game so that players <strong>cannot</strong> re-use integers?</p>

<p>For example, two players might take turns drawing from a common pool of numbers from 1 to 15 without replacement until they reach a total &gt;= 100.</p>

<p>Given two integers <code>maxChoosableInteger</code> and <code>desiredTotal</code>, return <code>true</code> if the first player to move can force a win, otherwise, return <code>false</code>. Assume both players play <strong>optimally</strong>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> maxChoosableInteger = 10, desiredTotal = 11
<strong>Output:</strong> false
<strong>Explanation:</strong>
No matter which integer the first player choose, the first player will lose.
The first player can choose an integer from 1 up to 10.
If the first player choose 1, the second player can only choose integers from 2 up to 10.
The second player will win by choosing 10 and get a total = 11, which is &gt;= desiredTotal.
Same with other integers chosen by the first player, the second player will always win.
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> maxChoosableInteger = 10, desiredTotal = 0
<strong>Output:</strong> true
</pre>

<p><strong class="example">Example 3:</strong></p>

<pre>
<strong>Input:</strong> maxChoosableInteger = 10, desiredTotal = 1
<strong>Output:</strong> true
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= maxChoosableInteger &lt;= 20</code></li>
	<li><code>0 &lt;= desiredTotal &lt;= 300</code></li>
</ul>"
---

```python
class Solution:
    
    def __init__(self):
        from sortedcontainers import SortedSet
        self.dict1 = []
        self.cache = {}

    def canIWin(self, maxChoosableInteger: int, desiredTotal: int) -> bool:
        self.dict1 = ["0"]* (maxChoosableInteger+1)
        self.dict1[0] = "1"
        if (maxChoosableInteger * (maxChoosableInteger + 1)) // 2 < desiredTotal:
            return False
        if desiredTotal <= 0:
            return True
        return self.MoveByA(maxChoosableInteger, desiredTotal)

    def MoveByA(self, maxChoosableInteger: int, desiredTotal: int) -> bool:
        key = f"{desiredTotal}#{','.join(self.dict1)}"

        if key in self.cache:
            return self.cache[key]
        if desiredTotal <= 0:
            return False # B won

        if "0" not in self.dict1:
            print("should never occur")
            return False

        for k in range(1, maxChoosableInteger+1):
            if self.dict1[k] == "0":
                self.dict1[k] = "1"
                key1 = f"{desiredTotal}#{','.join(self.dict1)}"
                if not self.MoveByB(maxChoosableInteger, desiredTotal-k):
                    self.cache[key1] = False
                    self.dict1[k] = "0"
                    self.cache[key] = True
                    return True
                self.cache[key1] = True
                self.dict1[k] = "0"
                
        self.cache[key] = False
        return False

    def MoveByB(self, maxChoosableInteger: int, desiredTotal: int) -> bool:
        key = f"{desiredTotal}#{','.join(self.dict1)}"
        if key in self.cache:
            return self.cache[key]

        if desiredTotal <= 0:
            return False # A won

        if "0" not in self.dict1:
            print("should never occur")
            return False

        for k in range(1, maxChoosableInteger+1):
            if self.dict1[k] == "0":
                self.dict1[k] = "1"
                key1 = f"{desiredTotal}#{','.join(self.dict1)}"
                if not self.MoveByA(maxChoosableInteger, desiredTotal-k):
                    self.cache[key1] = False
                    self.dict1[k] = "0"
                    self.cache[key] = True
                    return True
                self.cache[key1] = True
                self.dict1[k] = "0"
                
        self.cache[key] = False
        return False
        
            
        
```