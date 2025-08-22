---
title: "./40 Combination Sum Ii"
date: "2024-08-13T09:30:02+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/combination-sum-ii">Combination Sum II</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>Given a collection of candidate numbers (<code>candidates</code>) and a target number (<code>target</code>), find all unique combinations in <code>candidates</code>&nbsp;where the candidate numbers sum to <code>target</code>.</p>

<p>Each number in <code>candidates</code>&nbsp;may only be used <strong>once</strong> in the combination.</p>

<p><strong>Note:</strong>&nbsp;The solution set must not contain duplicate combinations.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> candidates = [10,1,2,7,6,1,5], target = 8
<strong>Output:</strong> 
[
[1,1,6],
[1,2,5],
[1,7],
[2,6]
]
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> candidates = [2,5,2,1,2], target = 5
<strong>Output:</strong> 
[
[1,2,2],
[5]
]
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;=&nbsp;candidates.length &lt;= 100</code></li>
	<li><code>1 &lt;=&nbsp;candidates[i] &lt;= 50</code></li>
	<li><code>1 &lt;= target &lt;= 30</code></li>
</ul>"
---

```python
class Solution:
    def combinationSum2(self, candidates: List[int], target: int) -> List[List[int]]:
        visited = [0] * len(candidates)
        result = []
        candidates.sort()
        
        def Traverse(visited, start, target):
            if target < 0:
                return 
            if target == 0:
                res = [] 
                for k in range(len(visited)):
                    if visited[k] == 1:
                        res.append(candidates[k])
                result.append(res)
                return
            
            for k in range(start, len(candidates)):
                if k > start and candidates[k] == candidates[k - 1]:
                    continue
                if target - candidates[k] < 0:
                    break
                visited[k] = 1
                Traverse(visited, k + 1, target - candidates[k])
                visited[k] = 0

        Traverse(visited, 0, target)
        return result
```