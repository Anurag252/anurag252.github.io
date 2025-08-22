---
title: "Fruit Into Baskets"
date: "2025-08-04T21:43:01+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 186 ms (51.21%) | Memory: 23.4 MB (88.39%) - LeetSync"
---

```python
from collections import defaultdict

class Solution:
    def totalFruit(self, fruits: list[int]) -> int:
        start = 0
        max_len = 0
        fruit_count = defaultdict(int)

        for end in range(len(fruits)):
            fruit_count[fruits[end]] += 1

            while len(fruit_count) > 2:
                fruit_count[fruits[start]] -= 1
                if fruit_count[fruits[start]] == 0:
                    del fruit_count[fruits[start]]
                start += 1

            max_len = max(max_len, end - start + 1)

        return max_len
```