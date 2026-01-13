---
            title: "3763 Separate Squares I"
            date: "2026-01-13T22:44:06+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Separate Squares I](https://leetcode.com/problems/separate-squares-i) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a 2D integer array squares. Each squares[i] = [xi, yi, li] represents the coordinates of the bottom-left point and the side length of a square parallel to the x-axis.

Find the **minimum** y-coordinate value of a horizontal line such that the total area of the squares above the line *equals* the total area of the squares below the line.

Answers within 10-5 of the actual answer will be accepted.

**Note**: Squares **may** overlap. Overlapping areas should be counted **multiple times**.

 

Example 1:

**Input:** squares = [[0,0,1],[2,2,1]]

**Output:** 1.00000

**Explanation:**

![image](https://assets.leetcode.com/uploads/2025/01/06/4062example1drawio.png)

Any horizontal line between y = 1 and y = 2 will have 1 square unit above it and 1 square unit below it. The lowest option is 1.

Example 2:

**Input:** squares = [[0,0,2],[1,1,1]]

**Output:** 1.16667

**Explanation:**

![image](https://assets.leetcode.com/uploads/2025/01/15/4062example2drawio.png)

The areas are:

	Below the line: 7/6 * 2 (Red) + 1/6 (Blue) = 15/6 = 2.5.
	Above the line: 5/6 * 2 (Red) + 5/6 (Blue) = 15/6 = 2.5.

Since the areas above and below the line are equal, the output is 7/6 = 1.16667.

 

**Constraints:**

	1 <= squares.length <= 5 * 104
	squares[i] = [xi, yi, li]
	squares[i].length == 3
	0 <= xi, yi <= 109
	1 <= li <= 109
	The total area of all the squares will not exceed 1012.

{% raw %}


```python


class Solution:
    def separateSquares(self, squares: List[List[int]]) -> float:
        # one idea of binary search is too slow
        # maybe we sort by area
        # then every new square moves the line a bit
        # a area both sides and at k and x,y,l then 
        # calculate a + m,a + n, find a + (m + n) // 2
        # if a + m > a + n then line moves towards m and vice versa
        # and by how much ? (m + n) // 2
        # bin search works https://chatgpt.com/share/6966b531-11f0-8012-b350-1569a270550d

        points = set()
        for m in squares:
            points.add(m[1])
            points.add(m[1] + m[2])
        points = sorted(points)

        left = points[0]
        right = points[-1]
        found = False
        
        while(abs(right-left) > 0.00001):
            area1 = 0
            area2 = 0
            mid = (right + left) / 2.0
            for m in squares:
                if m[1] > mid:
                    area2 += m[2] * m[2]
                elif m[1] + m[2] < mid:
                    area1 += m[2] * m[2]
                else:
                    area1 += (m[2] * (mid - m[1]))
                    area2 += (m[2] * (m[1] + m[2] - mid))
            if area1 >= area2:
                right = mid
            else:
                left = mid
        return left








{% endraw %}
```
