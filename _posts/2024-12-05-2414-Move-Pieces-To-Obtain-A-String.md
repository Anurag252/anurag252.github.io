---
title: "2414 Move Pieces To Obtain A String"
date: "2024-12-05T10:13:33+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
---


                            ## [Move Pieces to Obtain a String](https://leetcode.com/problems/move-pieces-to-obtain-a-string) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given two strings start and target, both of length n. Each string consists **only** of the characters 'L', 'R', and '_' where:

	The characters 'L' and 'R' represent pieces, where a piece 'L' can move to the **left** only if there is a **blank** space directly to its left, and a piece 'R' can move to the **right** only if there is a **blank** space directly to its right.
	The character '_' represents a blank space that can be occupied by **any** of the 'L' or 'R' pieces.

Return true *if it is possible to obtain the string* target* by moving the pieces of the string *start* **any** number of times*. Otherwise, return false.

 

Example 1:

```

**Input:** start = "_L__R__R_", target = "L______RR"
**Output:** true
**Explanation:** We can obtain the string target from start by doing the following moves:
- Move the first piece one step to the left, start becomes equal to "**L**___R__R_".
- Move the last piece one step to the right, start becomes equal to "L___R___**R**".
- Move the second piece three steps to the right, start becomes equal to "L______**R**R".
Since it is possible to get the string target from start, we return true.

```

Example 2:

```

**Input:** start = "R_L_", target = "__LR"
**Output:** false
**Explanation:** The 'R' piece in the string start can move one step to the right to obtain "_**R**L_".
After that, no pieces can move anymore, so it is impossible to obtain the string target from start.

```

Example 3:

```

**Input:** start = "_R", target = "R_"
**Output:** false
**Explanation:** The piece in the string start can move only to the right, so it is impossible to obtain the string target from start.
```

 

**Constraints:**

	n == start.length == target.length
	1 <= n <= 105
	start and target consist of the characters 'L', 'R', and '_'.

                            {% raw %}
                            ```python
                            class Solution:
    def canChange(self, start: str, target: str) -> bool:
        start_length = len(start)
        # pointers for start string and target string
        start_index, target_index = (0, 0)

        while start_index < start_length or target_index < start_length:
            # skip underscores in start
            while start_index < start_length and start[start_index] == "_":
                start_index += 1

            # skip underscores in target
            while target_index < start_length and target[target_index] == "_":
                target_index += 1

            # if one string exhausted, both strings should be exhausted
            if start_index == start_length or target_index == start_length:
                return (
                    start_index == start_length and target_index == start_length
                )

            # check if the pieces match and follow movement rules
            if (
                start[start_index] != target[target_index]
                or (start[start_index] == "L" and start_index < target_index)
                or (start[start_index] == "R" and start_index > target_index)
            ):
                return False

            start_index += 1
            target_index += 1

        # if all conditions satisfied, return true
        return True
                            {% endraw %}
                            