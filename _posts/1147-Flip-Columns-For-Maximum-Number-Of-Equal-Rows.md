---
title: "./1147 Flip Columns For Maximum Number Of Equal Rows"
date: "2024-11-22T09:12:59+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/flip-columns-for-maximum-number-of-equal-rows">Flip Columns For Maximum Number of Equal Rows</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>You are given an <code>m x n</code> binary matrix <code>matrix</code>.</p>

<p>You can choose any number of columns in the matrix and flip every cell in that column (i.e., Change the value of the cell from <code>0</code> to <code>1</code> or vice versa).</p>

<p>Return <em>the maximum number of rows that have all values equal after some number of flips</em>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> matrix = [[0,1],[1,1]]
<strong>Output:</strong> 1
<strong>Explanation:</strong> After flipping no values, 1 row has all values equal.
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> matrix = [[0,1],[1,0]]
<strong>Output:</strong> 2
<strong>Explanation:</strong> After flipping values in the first column, both rows have equal values.
</pre>

<p><strong class="example">Example 3:</strong></p>

<pre>
<strong>Input:</strong> matrix = [[0,0,0],[0,0,1],[1,1,0]]
<strong>Output:</strong> 2
<strong>Explanation:</strong> After flipping values in the first two columns, the last two rows have equal values.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>m == matrix.length</code></li>
	<li><code>n == matrix[i].length</code></li>
	<li><code>1 &lt;= m, n &lt;= 300</code></li>
	<li><code>matrix[i][j]</code> is either&nbsp;<code>0</code> or <code>1</code>.</li>
</ul>"
---

```python
class Solution:
    def maxEqualRowsAfterFlips(self, matrix: List[List[int]]) -> int:
        # let's say there is a row that is good, flipping it will make it bad
        # two rows become good after flips if rows are equal or complimentary
        # find rows that have same values and complimentatry values are same.
        # take max of both 
        arr = {}
        coml_arr = {}

        for row in matrix:
            key = ",".join(list(map(str,row)))
            if key in arr:
                arr[key] += 1
            else :
                arr[key] = 1

            compl_row = list(map(lambda x : "1" if x == 0 else "0", row))
            compl_key = ",".join(compl_row)
            if compl_key in arr:
                arr[compl_key] += 1
            else:
                arr[compl_key] = 1
        
        ans = 0
        #print(arr)
        for k1 in arr.values():
            ans = max(ans, k1)

        return ans



        
```