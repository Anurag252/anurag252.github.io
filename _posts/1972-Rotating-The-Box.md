---
title: "./1972 Rotating The Box"
date: "2024-11-23T09:00:19+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/rotating-the-box">Rotating the Box</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>You are given an <code>m x n</code> matrix of characters <code>box</code> representing a side-view of a box. Each cell of the box is one of the following:</p>

<ul>
	<li>A stone <code>&#39;#&#39;</code></li>
	<li>A stationary obstacle <code>&#39;*&#39;</code></li>
	<li>Empty <code>&#39;.&#39;</code></li>
</ul>

<p>The box is rotated <strong>90 degrees clockwise</strong>, causing some of the stones to fall due to gravity. Each stone falls down until it lands on an obstacle, another stone, or the bottom of the box. Gravity <strong>does not</strong> affect the obstacles&#39; positions, and the inertia from the box&#39;s rotation <strong>does not </strong>affect the stones&#39; horizontal positions.</p>

<p>It is <strong>guaranteed</strong> that each stone in <code>box</code> rests on an obstacle, another stone, or the bottom of the box.</p>

<p>Return <em>an </em><code>n x m</code><em> matrix representing the box after the rotation described above</em>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<p><img alt="" src="https://assets.leetcode.com/uploads/2021/04/08/rotatingtheboxleetcodewithstones.png" style="width: 300px; height: 150px;" /></p>

<pre>
<strong>Input:</strong> box = [[&quot;#&quot;,&quot;.&quot;,&quot;#&quot;]]
<strong>Output:</strong> [[&quot;.&quot;],
&nbsp;        [&quot;#&quot;],
&nbsp;        [&quot;#&quot;]]
</pre>

<p><strong class="example">Example 2:</strong></p>

<p><img alt="" src="https://assets.leetcode.com/uploads/2021/04/08/rotatingtheboxleetcode2withstones.png" style="width: 375px; height: 195px;" /></p>

<pre>
<strong>Input:</strong> box = [[&quot;#&quot;,&quot;.&quot;,&quot;*&quot;,&quot;.&quot;],
&nbsp;             [&quot;#&quot;,&quot;#&quot;,&quot;*&quot;,&quot;.&quot;]]
<strong>Output:</strong> [[&quot;#&quot;,&quot;.&quot;],
&nbsp;        [&quot;#&quot;,&quot;#&quot;],
&nbsp;        [&quot;*&quot;,&quot;*&quot;],
&nbsp;        [&quot;.&quot;,&quot;.&quot;]]
</pre>

<p><strong class="example">Example 3:</strong></p>

<p><img alt="" src="https://assets.leetcode.com/uploads/2021/04/08/rotatingtheboxleetcode3withstone.png" style="width: 400px; height: 218px;" /></p>

<pre>
<strong>Input:</strong> box = [[&quot;#&quot;,&quot;#&quot;,&quot;*&quot;,&quot;.&quot;,&quot;*&quot;,&quot;.&quot;],
&nbsp;             [&quot;#&quot;,&quot;#&quot;,&quot;#&quot;,&quot;*&quot;,&quot;.&quot;,&quot;.&quot;],
&nbsp;             [&quot;#&quot;,&quot;#&quot;,&quot;#&quot;,&quot;.&quot;,&quot;#&quot;,&quot;.&quot;]]
<strong>Output:</strong> [[&quot;.&quot;,&quot;#&quot;,&quot;#&quot;],
&nbsp;        [&quot;.&quot;,&quot;#&quot;,&quot;#&quot;],
&nbsp;        [&quot;#&quot;,&quot;#&quot;,&quot;*&quot;],
&nbsp;        [&quot;#&quot;,&quot;*&quot;,&quot;.&quot;],
&nbsp;        [&quot;#&quot;,&quot;.&quot;,&quot;*&quot;],
&nbsp;        [&quot;#&quot;,&quot;.&quot;,&quot;.&quot;]]
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>m == box.length</code></li>
	<li><code>n == box[i].length</code></li>
	<li><code>1 &lt;= m, n &lt;= 500</code></li>
	<li><code>box[i][j]</code> is either <code>&#39;#&#39;</code>, <code>&#39;*&#39;</code>, or <code>&#39;.&#39;</code>.</li>
</ul>"
---

```python
class Solution:
    def rotateTheBox(self, box: List[List[str]]) -> List[List[str]]:
        ans = []
        for rows in box:
            start = 0
            end = len(rows) - 1
            temp = end
            prev = "."
            res = []
            while(temp >= 0):
                if rows[temp] == "#":
                    m = 0
                    while(len(res) > 0 and res[-1] == "."):
                        m += 1
                        res.pop(-1)
                    res.append("#")
                    while(m > 0):
                        res.append(".")
                        m -= 1

                    temp -= 1
                    continue
                if rows[temp] == ".":
                    res.append(".")
                    temp -= 1
                    continue
                if rows[temp] == "*":
                    res.append("*")
                    temp -= 1
                    continue
            # fill empty at end
            #print(res)
            while(len(res) < len(rows)):
                res.append(".")
            # reverse
            res.reverse()
            ans.append(copy.deepcopy(res))
        ans.reverse()
        row = 0
        col = 0
        result = []
        t = []
        #print(ans)
        while(col < len(ans[0])  and row < len(ans)):
            
            if row == len(ans) - 1:
                t.append(ans[row][col])
                col += 1
                row = 0
                result.append(copy.deepcopy(t))
                t = []
                continue
            t.append(ans[row][col])
            #print(t)
            row += 1
        return result

                    
                

        
```