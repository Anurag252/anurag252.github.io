---
title: "./1895 Minimum Number Of Operations To Move All Balls To Each Box"
date: "2025-01-06T13:15:45+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/minimum-number-of-operations-to-move-all-balls-to-each-box">Minimum Number of Operations to Move All Balls to Each Box</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>You have <code>n</code> boxes. You are given a binary string <code>boxes</code> of length <code>n</code>, where <code>boxes[i]</code> is <code>&#39;0&#39;</code> if the <code>i<sup>th</sup></code> box is <strong>empty</strong>, and <code>&#39;1&#39;</code> if it contains <strong>one</strong> ball.</p>

<p>In one operation, you can move <strong>one</strong> ball from a box to an adjacent box. Box <code>i</code> is adjacent to box <code>j</code> if <code>abs(i - j) == 1</code>. Note that after doing so, there may be more than one ball in some boxes.</p>

<p>Return an array <code>answer</code> of size <code>n</code>, where <code>answer[i]</code> is the <strong>minimum</strong> number of operations needed to move all the balls to the <code>i<sup>th</sup></code> box.</p>

<p>Each <code>answer[i]</code> is calculated considering the <strong>initial</strong> state of the boxes.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> boxes = &quot;110&quot;
<strong>Output:</strong> [1,1,3]
<strong>Explanation:</strong> The answer for each box is as follows:
1) First box: you will have to move one ball from the second box to the first box in one operation.
2) Second box: you will have to move one ball from the first box to the second box in one operation.
3) Third box: you will have to move one ball from the first box to the third box in two operations, and move one ball from the second box to the third box in one operation.
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> boxes = &quot;001011&quot;
<strong>Output:</strong> [11,8,5,4,3,4]</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>n == boxes.length</code></li>
	<li><code>1 &lt;= n &lt;= 2000</code></li>
	<li><code>boxes[i]</code> is either <code>&#39;0&#39;</code> or <code>&#39;1&#39;</code>.</li>
</ul>"
---

```python
class Solution:
    def minOperations(self, boxes: str) -> List[int]:
        """
        [. . . . . x . . . .]
        to calculate the number of moves , you must know where are 1s in arr and how far 
        let's say 1, 3 
        x-1, x-3 is the dist 
        similarly in revrse arr n-x-1th elem find 1s and their sum
        x1 . x2 . x3 . x4 . x4 .. xn
        xn - x1 + xn - x2 + xn- x3 ..
        nXn - (x1+x2+x3)

        """
        pref = []
        suff = []
        temp = 0
        count = 0
        for idx, k in enumerate(boxes):
            if k == "1":
                temp += idx
                count += 1
            pref.append((temp, count))

        temp = 0
        count = 0
        for idx, k in enumerate(boxes[::-1]):
            if k == "1":
                temp += idx
                count += 1
            suff.append((temp, count))
        res = []
        for idx, k in enumerate(pref):
            left  =  k[1] * idx - k[0]
            right_idx = len(pref) - 1 - idx
            right = suff[right_idx][1] * right_idx - suff[right_idx][0]
            res.append(left + right)
        return res
        """
        print(pref, suff)
        2*1 - 1 + 1-1
        2*2-1 + 0
        count * idx - sum
        """



        


        
```