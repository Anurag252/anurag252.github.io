---
            title: "830 Largest Triangle Area"
            date: "2025-09-27T22:22:28+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Largest Triangle Area](https://leetcode.com/problems/largest-triangle-area) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

Given an array of points on the **X-Y** plane points where points[i] = [xi, yi], return *the area of the largest triangle that can be formed by any three different points*. Answers within 10-5 of the actual answer will be accepted.

 

Example 1:

![image](https://s3-lc-upload.s3.amazonaws.com/uploads/2018/04/04/1027.png)
```

**Input:** points = [[0,0],[0,1],[1,0],[0,2],[2,0]]
**Output:** 2.00000
**Explanation:** The five points are shown in the above figure. The red triangle is the largest.

```

Example 2:

```

**Input:** points = [[1,0],[0,0],[0,1]]
**Output:** 0.50000

```

 

**Constraints:**

	3 <= points.length <= 50
	-50 <= xi, yi <= 50
	All the given points are **unique**.

{% raw %}


```python


from typing import List
from math import sqrt

class Solution:
    def largestTriangleArea(self, points: List[List[int]]) -> float:
        res = 0
        n = len(points)
        for i in range(n):
            for j in range(n):
                for k in range(n):
                    if i != j and i != k and j != k:
                        # sides
                        a = sqrt((points[i][0]-points[j][0])**2 + (points[i][1]-points[j][1])**2)
                        b = sqrt((points[i][0]-points[k][0])**2 + (points[i][1]-points[k][1])**2)
                        c = sqrt((points[j][0]-points[k][0])**2 + (points[j][1]-points[k][1])**2)

                        if a == 0 or b == 0 or c == 0:
                            continue  # degenerate

                        # height from point k to base a (i–j)
                        proj = (b**2 + a**2 - c**2) / (2*a)   # projection length
                        h = sqrt(max(0.0, b**2 - proj**2))    # height (safe sqrt)
                        area = 0.5 * a * h

                        res = max(res, area)
        return res



{% endraw %}
```
