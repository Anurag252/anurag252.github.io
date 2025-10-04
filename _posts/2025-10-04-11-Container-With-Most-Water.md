---
            title: "11 Container With Most Water"
            date: "2025-10-04T22:40:03+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Container With Most Water](https://leetcode.com/problems/container-with-most-water) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).

Find two lines that together with the x-axis form a container, such that the container contains the most water.

Return *the maximum amount of water a container can store*.

**Notice** that you may not slant the container.

 

Example 1:

![image](https://s3-lc-upload.s3.amazonaws.com/uploads/2018/07/17/question_11.jpg)
```

**Input:** height = [1,8,6,2,5,4,8,3,7]
**Output:** 49
**Explanation:** The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.

```

Example 2:

```

**Input:** height = [1,1]
**Output:** 1

```

 

**Constraints:**

	n == height.length
	2 <= n <= 105
	0 <= height[i] <= 104

{% raw %}


```python


class Solution:
    def maxArea(self, height: List[int]) -> int:
        left = 0
        right = len(height) - 1
        max_area = 0

        while left < right:
            # Calculate current width
            width = right - left
            
            # Determine current height (limited by the shorter line)
            current_height = min(height[left], height[right])
            
            # Calculate current area
            current_area = width * current_height
            
            # Update max_area if current_area is larger
            max_area = max(max_area, current_area)
            
            # Move the pointer of the shorter line inwards
            if height[left] < height[right]:
                left += 1
            else:
                right -= 1
                
        return max_area


{% endraw %}
```
