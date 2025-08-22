---
            title: "2649 Count Total Number Of Colored Cells"
            date: "2025-03-05T11:55:31+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Count Total Number of Colored Cells](https://leetcode.com/problems/count-total-number-of-colored-cells) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

There exists an infinitely large two-dimensional grid of uncolored unit cells. You are given a positive integer n, indicating that you must do the following routine for n minutes:

	At the first minute, color **any** arbitrary unit cell blue.
	Every minute thereafter, color blue **every** uncolored cell that touches a blue cell.

Below is a pictorial representation of the state of the grid after minutes 1, 2, and 3.

![image](https://assets.leetcode.com/uploads/2023/01/10/example-copy-2.png)

Return *the number of **colored cells** at the end of *n *minutes*.

 

Example 1:

```

**Input:** n = 1
**Output:** 1
**Explanation:** After 1 minute, there is only 1 blue cell, so we return 1.

```

Example 2:

```

**Input:** n = 2
**Output:** 5
**Explanation:** After 2 minutes, there are 4 colored cells on the boundary and 1 in the center, so we return 5. 

```

 

**Constraints:**

	1 <= n <= 105

{% raw %}


````python


class Solution:
    def coloredCells(self, n: int) -> int:
        """
        1, 4 +1, 8 + 4 + 1, 12 + 8 + 4 + 1
        """
        k = 0
        for i in range(1, n+1):
            if i == 1:
                k += i
            else:
                k += 4*(i-1)
        return k
        if n == 1:
            return 1

        return 4*(n-1) + self.coloredCells(n-1)


{% endraw %}
