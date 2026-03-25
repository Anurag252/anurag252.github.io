---
            title: "3849 Equal Sum Grid Partition I"
            date: "2026-03-25T21:30:11+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Equal Sum Grid Partition I](https://leetcode.com/problems/equal-sum-grid-partition-i) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given an m x n matrix grid of positive integers. Your task is to determine if it is possible to make **either one horizontal or one vertical cut** on the grid such that:

	Each of the two resulting sections formed by the cut is **non-empty**.
	The sum of the elements in both sections is **equal**.

Return true if such a partition exists; otherwise return false.

 

Example 1:

**Input:** grid = [[1,4],[2,3]]

**Output:** true

**Explanation:**

![image](https://assets.leetcode.com/uploads/2025/03/30/lc.png)![image](https://assets.leetcode.com/uploads/2025/03/30/lc.jpeg)

A horizontal cut between row 0 and row 1 results in two non-empty sections, each with a sum of 5. Thus, the answer is true.

Example 2:

**Input:** grid = [[1,3],[2,4]]

**Output:** false

**Explanation:**

No horizontal or vertical cut results in two non-empty sections with equal sums. Thus, the answer is false.

 

**Constraints:**

	1 <= m == grid.length <= 105
	1 <= n == grid[i].length <= 105
	2 <= m * n <= 105
	1 <= grid[i][j] <= 105

{% raw %}


```python


class Solution:
    def canPartitionGrid(self, grid: List[List[int]]) -> bool:
        a = []
        b = []
        pref_a = []
        pref_b = []

        for k in grid:
            a.append(sum(k))
        t = 0
        
        while(t < len(grid[0])):
            p = 0
            i = 0
            while(i < len(grid)):
                p += grid[i][t]
                i += 1
            b.append(p)
            t += 1
        print(b)
        


        temp = 0
        for m in a:
            temp += m
            pref_a.append(temp)
        print(pref_a, a)

        total = pref_a[-1] / 2
        for m in pref_a:
            if m == total:
                return True

        temp = 0
        for m in b:
            temp += m
            pref_b.append(temp)
        print(pref_b, b)

        total = pref_b[-1] / 2
        for m in pref_b:
            if m == total:
                return True
        return False



{% endraw %}
```
