---
title: "./1917 Maximum Average Pass Ratio"
date: "2024-12-15T11:01:46+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/maximum-average-pass-ratio">Maximum Average Pass Ratio</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>There is a school that has classes of students and each class will be having a final exam. You are given a 2D integer array <code>classes</code>, where <code>classes[i] = [pass<sub>i</sub>, total<sub>i</sub>]</code>. You know beforehand that in the <code>i<sup>th</sup></code> class, there are <code>total<sub>i</sub></code> total students, but only <code>pass<sub>i</sub></code> number of students will pass the exam.</p>

<p>You are also given an integer <code>extraStudents</code>. There are another <code>extraStudents</code> brilliant students that are <strong>guaranteed</strong> to pass the exam of any class they are assigned to. You want to assign each of the <code>extraStudents</code> students to a class in a way that <strong>maximizes</strong> the <strong>average</strong> pass ratio across <strong>all</strong> the classes.</p>

<p>The <strong>pass ratio</strong> of a class is equal to the number of students of the class that will pass the exam divided by the total number of students of the class. The <strong>average pass ratio</strong> is the sum of pass ratios of all the classes divided by the number of the classes.</p>

<p>Return <em>the <strong>maximum</strong> possible average pass ratio after assigning the </em><code>extraStudents</code><em> students. </em>Answers within <code>10<sup>-5</sup></code> of the actual answer will be accepted.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> classes = [[1,2],[3,5],[2,2]], <code>extraStudents</code> = 2
<strong>Output:</strong> 0.78333
<strong>Explanation:</strong> You can assign the two extra students to the first class. The average pass ratio will be equal to (3/4 + 3/5 + 2/2) / 3 = 0.78333.
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> classes = [[2,4],[3,9],[4,5],[2,10]], <code>extraStudents</code> = 4
<strong>Output:</strong> 0.53485
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= classes.length &lt;= 10<sup>5</sup></code></li>
	<li><code>classes[i].length == 2</code></li>
	<li><code>1 &lt;= pass<sub>i</sub> &lt;= total<sub>i</sub> &lt;= 10<sup>5</sup></code></li>
	<li><code>1 &lt;= extraStudents &lt;= 10<sup>5</sup></code></li>
</ul>"
---

```python
class Solution:
    def maxAverageRatio(self, classes: List[List[int]], extraStudents: int) -> float:
        if len(classes) == 0:
            return 0
        h = []
        for idx, k in enumerate(classes):
            heapq.heappush(h, ( -(k[1] - k[0]) / (k[1] * k[1] + k[1]), idx ))
        
        """
        a/b
        a + 1/b + 1
        a/b - (a + 1)/(b + 1)
        ab +a - ab -b / (bb + b)

        (b-a) / (bb +b)
        """
        
        while(extraStudents > 0):
            #h.sort(key=lambda x : -(x[1] - x[0]) / (x[1] * x[1] + x[1]))
            item1, idx = heapq.heappop(h)
            #print(h)
            classes[idx][0] += 1
            classes[idx][1] += 1
            heapq.heappush(h, (-(classes[idx][1] - classes[idx][0]) / (classes[idx][1] * classes[idx][1] + classes[idx][1]) , idx))
            extraStudents -= 1
        result = 0
        
        for k in h:
            result += (classes[k[1]][0]/classes[k[1]][1] * 100)
        #print(h, result)
        return (result / len(h)) / 100


        # at each level find the max change that can occur by adding one student
"""
        0.5 0.6 1
        0.66 0.6 1
        0.5 0.66
        """
```