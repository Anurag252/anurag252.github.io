---
title: "Maximum Candies You Can Get From Boxes"
date: "2025-06-03T09:07:35+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 12 ms (85.44%) | Memory: 28.2 MB (28.35%) - LeetSync"
---

```python
from typing import List

class Solution:
    def maxCandies(
        self,
        status: List[int],
        candies: List[int],
        keys: List[List[int]],
        containedBoxes: List[List[int]],
        initialBoxes: List[int]
    ) -> int:

        n = len(status)
        has_box = [False] * n
        has_key = [False] * n
        visited = [False] * n

        # Mark which boxes we have from the beginning
        for box in initialBoxes:
            has_box[box] = True

        total_candies = 0

        def try_open_boxes():
            nonlocal total_candies
            changed = True
            while changed:
                changed = False
                for i in range(n):
                    # Only visit boxes we have, haven't opened, and are now openable
                    if has_box[i] and not visited[i] and (status[i] == 1 or has_key[i]):
                        visited[i] = True
                        total_candies += candies[i]
                        changed = True

                        # Collect keys
                        for k in keys[i]:
                            if not has_key[k]:
                                has_key[k] = True
                                # we may now be able to open a box we skipped earlier

                        # Collect boxes
                        for b in containedBoxes[i]:
                            if not has_box[b]:
                                has_box[b] = True

        try_open_boxes()
        return total_candies

```