---
            title: "3279 Alice And Bob Playing Flower Game"
            date: "2025-08-29T09:53:26+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Alice and Bob Playing Flower Game](https://leetcode.com/problems/alice-and-bob-playing-flower-game) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Alice and Bob are playing a turn-based game on a field, with two lanes of flowers between them. There are x flowers in the first lane between Alice and Bob, and y flowers in the second lane between them.

![image](https://assets.leetcode.com/uploads/2025/08/27/3021.png)

The game proceeds as follows:

	Alice takes the first turn.
	In each turn, a player must choose either one of the lane and pick one flower from that side.
	At the end of the turn, if there are no flowers left at all, the **current** player captures their opponent and wins the game.

Given two integers, n and m, the task is to compute the number of possible pairs (x, y) that satisfy the conditions:

	Alice must win the game according to the described rules.
	The number of flowers x in the first lane must be in the range [1,n].
	The number of flowers y in the second lane must be in the range [1,m].

Return *the number of possible pairs* (x, y) *that satisfy the conditions mentioned in the statement*.

 

Example 1:

```

**Input:** n = 3, m = 2
**Output:** 3
**Explanation:** The following pairs satisfy conditions described in the statement: (1,2), (3,2), (2,1).

```

Example 2:

```

**Input:** n = 1, m = 1
**Output:** 0
**Explanation:** No pairs satisfy the conditions described in the statement.

```

 

**Constraints:**

	1 <= n, m <= 105

{% raw %}


```python


class Solution:
    def flowerGame(self, n: int, m: int) -> int:
        """
            if Alice is to win starting first
            then odd number of flowers in one lane 
            if two lanes then sum is odd ?
            does it make a diff if all are at same lane ?
            no difference just that 
            x + y is odd and 1 < x < n amd 1 < y < m
            say i use 2 loops, that would be slow
            odd + even = odd

            so find all odds in 1,n and even in 1,m 
            then multiply
            then opposite

        """
        nums_of_odd_n = (n // 2) if n % 2 == 0 else (n // 2 + 1)
        nums_of_even_n = n // 2 

        nums_of_odd_m = (m // 2) if (m % 2 == 0) else (m // 2 + 1)
        nums_of_even_m = m // 2 

        return (nums_of_odd_n * nums_of_even_m) + (nums_of_even_n * nums_of_odd_m)

        


{% endraw %}
```
