---
title: "./2685 First Completely Painted Row Or Column"
date: "2025-01-20T08:03:26+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/first-completely-painted-row-or-column">First Completely Painted Row or Column</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>You are given a <strong>0-indexed</strong> integer array <code>arr</code>, and an <code>m x n</code> integer <strong>matrix</strong> <code>mat</code>. <code>arr</code> and <code>mat</code> both contain <strong>all</strong> the integers in the range <code>[1, m * n]</code>.</p>

<p>Go through each index <code>i</code> in <code>arr</code> starting from index <code>0</code> and paint the cell in <code>mat</code> containing the integer <code>arr[i]</code>.</p>

<p>Return <em>the smallest index</em> <code>i</code> <em>at which either a row or a column will be completely painted in</em> <code>mat</code>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>
<img alt="" src="image explanation for example 1" /><img alt="image explanation for example 1" src="https://assets.leetcode.com/uploads/2023/01/18/grid1.jpg" style="width: 321px; height: 81px;" />
<pre>
<strong>Input:</strong> arr = [1,3,4,2], mat = [[1,4],[2,3]]
<strong>Output:</strong> 2
<strong>Explanation:</strong> The moves are shown in order, and both the first row and second column of the matrix become fully painted at arr[2].
</pre>

<p><strong class="example">Example 2:</strong></p>
<img alt="image explanation for example 2" src="https://assets.leetcode.com/uploads/2023/01/18/grid2.jpg" style="width: 601px; height: 121px;" />
<pre>
<strong>Input:</strong> arr = [2,8,7,4,1,3,5,6,9], mat = [[3,2,5],[1,4,6],[8,7,9]]
<strong>Output:</strong> 3
<strong>Explanation:</strong> The second column becomes fully painted at arr[3].
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>m == mat.length</code></li>
	<li><code>n = mat[i].length</code></li>
	<li><code>arr.length == m * n</code></li>
	<li><code>1 &lt;= m, n &lt;= 10<sup>5</sup></code></li>
	<li><code>1 &lt;= m * n &lt;= 10<sup>5</sup></code></li>
	<li><code>1 &lt;= arr[i], mat[r][c] &lt;= m * n</code></li>
	<li>All the integers of <code>arr</code> are <strong>unique</strong>.</li>
	<li>All the integers of <code>mat</code> are <strong>unique</strong>.</li>
</ul>"
---

```go
func firstCompleteIndex(arr []int, mat [][]int) int {
    // cache row and col for all elements from mat
    // maintain another arr of row , and col sizes and initialize each element to col and row 
    // read the arr and reduce each row and col , when you reach till 0 return
    
    mp := make(map[int]string)
    for a, _ := range mat {
        for b, j := range mat[a] {
            //fmt.Println(strconv.Itoa(a) + "$" + strconv.Itoa(b))
            mp[j] = strconv.Itoa(a) + "$" + strconv.Itoa(b)
        }
    }
    //fmt.Println(mp)

    row := make([]int, len(mat))
    col := make([]int, len(mat[0]))

    for a, _ := range row {
        row[a] = len(mat[0])
    }

    for a, _ := range col {
        col[a] = len(mat)
    }

    for i, elem := range arr {
        parts := mp[elem]
        r, _ := strconv.Atoi(strings.Split(parts, "$")[0])
        c, _  := strconv.Atoi(strings.Split(parts, "$")[1])
        row[r] --
        if row[r] == 0 {
            return i
        }

        col[c] --
        if col[c] == 0 {
            return i
        }
    }

    return -1
}
```