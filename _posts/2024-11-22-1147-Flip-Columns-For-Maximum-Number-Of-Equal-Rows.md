---
            title: "1147 Flip Columns For Maximum Number Of Equal Rows"
            date: "2024-11-22T09:12:59+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Flip Columns For Maximum Number of Equal Rows](https://leetcode.com/problems/flip-columns-for-maximum-number-of-equal-rows) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given an m x n binary matrix matrix.

You can choose any number of columns in the matrix and flip every cell in that column (i.e., Change the value of the cell from 0 to 1 or vice versa).

Return *the maximum number of rows that have all values equal after some number of flips*.

 

Example 1:

```

**Input:** matrix = [[0,1],[1,1]]
**Output:** 1
**Explanation:** After flipping no values, 1 row has all values equal.

```

Example 2:

```

**Input:** matrix = [[0,1],[1,0]]
**Output:** 2
**Explanation:** After flipping values in the first column, both rows have equal values.

```

Example 3:

```

**Input:** matrix = [[0,0,0],[0,0,1],[1,1,0]]
**Output:** 2
**Explanation:** After flipping values in the first two columns, the last two rows have equal values.

```

 

**Constraints:**

	m == matrix.length
	n == matrix[i].length
	1 <= m, n <= 300
	matrix[i][j] is either 0 or 1.

{% raw %}


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



        


{% endraw %}
```
