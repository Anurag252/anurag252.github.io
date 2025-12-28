---
            title: "1476 Count Negative Numbers In A Sorted Matrix"
            date: "2025-12-28T22:03:00+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Count Negative Numbers in a Sorted Matrix](https://leetcode.com/problems/count-negative-numbers-in-a-sorted-matrix) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

Given a m x n matrix grid which is sorted in non-increasing order both row-wise and column-wise, return *the number of **negative** numbers in* grid.

 

Example 1:

```

**Input:** grid = [[4,3,2,-1],[3,2,1,-1],[1,1,-1,-2],[-1,-1,-2,-3]]
**Output:** 8
**Explanation:** There are 8 negatives number in the matrix.

```

Example 2:

```

**Input:** grid = [[3,2],[1,0]]
**Output:** 0

```

 

**Constraints:**

	m == grid.length
	n == grid[i].length
	1 <= m, n <= 100
	-100 <= grid[i][j] <= 100

 

**Follow up:** Could you find an O(n + m) solution?

{% raw %}


```python


class Solution:
    def countNegatives(self, grid: List[List[int]]) -> int:
        ans = 0
        for k in grid:
            left = 0
            right = len(k) - 1
            if k[right] >= 0:
                continue
            while(left < right):
                print(left, right)
                mid = (right + left) // 2
                if k[mid] < 0:
                    right = mid 
                else :
                    left = mid + 1
            ans += (len(k)   - right )
            #print(len(k)  - right)
        return ans
            
            
        


{% endraw %}
```
