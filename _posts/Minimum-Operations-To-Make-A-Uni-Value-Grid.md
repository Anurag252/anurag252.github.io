---
title: "Minimum Operations To Make A Uni Value Grid"
date: "2025-03-26T09:56:22+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 153 ms (63.16%) | Memory: 38.8 MB (91.23%) - LeetSync"
---

```python
class Solution:
    def minOperations(self, grid: List[List[int]], x: int) -> int:
        # brute force one can easly apply change on one element and recurse on others
        # grid is not needed, it could be one array
        # intutn - minimum steps would be somewhere between min amd max, maybe no
        # could we bin search for min element ? no as # of operations is no incr
        # in fact its a curve with lowest point as answer
        # is it true that uni val is always one of the elements of array ? yes , may be no
        # if there are two elements with same is that uni value - not necessary 
        # imagine 1,2,3,5,5 - 1 - making uni val as 3 we get 7 but unival as 5 we get 9 ops
        # line sweep ? 
        # how about dp - T[] = T[]
        # of all states possible ans lies in one path to node
        # we do not know dest node or path 
        # bfs 
        # after first hint, substraction is division -> 
        # 2 + 2k1, 4 + 2k2 . . . 6 + 2k3 , 8 + 2k4
        # 2 - 2k1 , ...
        nums_array = []
        result = 0

        # Flatten the grid into nums_array
        for row in grid:
            for num in row:
                nums_array.append(num)

        # Sort nums_array in non-decreasing order to easily find the median
        nums_array.sort()

        length = len(nums_array)
        # Store the median element as the final common value
        final_common_number = nums_array[length // 2]

        # Iterate through each number in nums_array
        for number in nums_array:
            # If the remainder when divided by x is different, return -1
            if number % x != final_common_number % x:
                return -1
            # Add the number of operations required to make the current number equal to final_common_number
            result += abs(final_common_number - number) // x

        return result
        
```