---
title: "2695 Find Score Of An Array After Marking All Elements"
date: "2024-12-13T08:08:16+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
---


                            ## [Find Score of an Array After Marking All Elements](https://leetcode.com/problems/find-score-of-an-array-after-marking-all-elements) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given an array nums consisting of positive integers.

Starting with score = 0, apply the following algorithm:

	Choose the smallest integer of the array that is not marked. If there is a tie, choose the one with the smallest index.
	Add the value of the chosen integer to score.
	Mark **the chosen element and its two adjacent elements if they exist**.
	Repeat until all the array elements are marked.

Return *the score you get after applying the above algorithm*.

 

Example 1:

```

**Input:** nums = [2,1,3,4,5,2]
**Output:** 7
**Explanation:** We mark the elements as follows:
- 1 is the smallest unmarked element, so we mark it and its two adjacent elements: [2,1,3,4,5,2].
- 2 is the smallest unmarked element, so we mark it and its left adjacent element: [2,1,3,4,5,2].
- 4 is the only remaining unmarked element, so we mark it: [2,1,3,4,5,2].
Our score is 1 + 2 + 4 = 7.

```

Example 2:

```

**Input:** nums = [2,3,5,1,3,2]
**Output:** 5
**Explanation:** We mark the elements as follows:
- 1 is the smallest unmarked element, so we mark it and its two adjacent elements: [2,3,5,1,3,2].
- 2 is the smallest unmarked element, since there are two of them, we choose the left-most one, so we mark the one at index 0 and its right adjacent element: [2,3,5,1,3,2].
- 2 is the only remaining unmarked element, so we mark it: [2,3,5,1,3,2].
Our score is 1 + 2 + 2 = 5.

```

 

**Constraints:**

	1 <= nums.length <= 105
	1 <= nums[i] <= 106

                            {% raw %}
                            ```python
                            class Solution:
    def findScore(self, nums: List[int]) -> int:
        s = set()

        h = []

        for idx, k in enumerate(nums):
            heapq.heappush(h, (k, idx))
        score = 0
        while(len(h) > 0):
            item = heapq.heappop(h)
            if item[1] not in s:
                s.add(item[1])
                s.add(item[1] + 1)
                s.add(item[1] - 1)
                score += item[0]
        return score

        
                            {% endraw %}
                            