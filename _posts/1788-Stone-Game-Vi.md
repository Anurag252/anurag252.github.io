---
title: "./1788 Stone Game Vi"
date: "2024-06-03T09:50:51+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/stone-game-vi">Stone Game VI</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>Alice and Bob take turns playing a game, with Alice starting first.</p>

<p>There are <code>n</code> stones in a pile. On each player&#39;s turn, they can <strong>remove</strong> a stone from the pile and receive points based on the stone&#39;s value. Alice and Bob may <strong>value the stones differently</strong>.</p>

<p>You are given two integer arrays of length <code>n</code>, <code>aliceValues</code> and <code>bobValues</code>. Each <code>aliceValues[i]</code> and <code>bobValues[i]</code> represents how Alice and Bob, respectively, value the <code>i<sup>th</sup></code> stone.</p>

<p>The winner is the person with the most points after all the stones are chosen. If both players have the same amount of points, the game results in a draw. Both players will play <strong>optimally</strong>.&nbsp;Both players know the other&#39;s values.</p>

<p>Determine the result of the game, and:</p>

<ul>
	<li>If Alice wins, return <code>1</code>.</li>
	<li>If Bob wins, return <code>-1</code>.</li>
	<li>If the game results in a draw, return <code>0</code>.</li>
</ul>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> aliceValues = [1,3], bobValues = [2,1]
<strong>Output:</strong> 1
<strong>Explanation:</strong>
If Alice takes stone 1 (0-indexed) first, Alice will receive 3 points.
Bob can only choose stone 0, and will only receive 2 points.
Alice wins.
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> aliceValues = [1,2], bobValues = [3,1]
<strong>Output:</strong> 0
<strong>Explanation:</strong>
If Alice takes stone 0, and Bob takes stone 1, they will both have 1 point.
Draw.
</pre>

<p><strong class="example">Example 3:</strong></p>

<pre>
<strong>Input:</strong> aliceValues = [2,4,3], bobValues = [1,6,7]
<strong>Output:</strong> -1
<strong>Explanation:</strong>
Regardless of how Alice plays, Bob will be able to have more points than Alice.
For example, if Alice takes stone 1, Bob can take stone 2, and Alice takes stone 0, Alice will have 6 points to Bob&#39;s 7.
Bob wins.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>n == aliceValues.length == bobValues.length</code></li>
	<li><code>1 &lt;= n &lt;= 10<sup>5</sup></code></li>
	<li><code>1 &lt;= aliceValues[i], bobValues[i] &lt;= 100</code></li>
</ul>"
---

```python
class Solution:
    def stoneGameVI(self, aliceValues: List[int], bobValues: List[int]) -> int:
        new_list = []
        for k,l in zip(aliceValues, bobValues):
            new_list.append((k , l))
        print(new_list)
        new_list.sort(key = lambda  x : sum(x), reverse = True )
        print(new_list)
        a = 0
        b = 0
        is_odd = True
        for k in new_list:
            if is_odd:
                a= a + k[0]
                is_odd = False
            else:
                b = b + k[1]
                is_odd = True
        if a > b:
            return 1
        if a < b :
            return -1
        return 0

        
```