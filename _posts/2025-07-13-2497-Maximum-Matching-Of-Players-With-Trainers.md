---
            title: "2497 Maximum Matching Of Players With Trainers"
            date: "2025-07-13T07:00:28+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Maximum Matching of Players With Trainers](https://leetcode.com/problems/maximum-matching-of-players-with-trainers) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a **0-indexed** integer array players, where players[i] represents the **ability** of the ith player. You are also given a **0-indexed** integer array trainers, where trainers[j] represents the **training capacity **of the jth trainer.

The ith player can **match** with the jth trainer if the player's ability is **less than or equal to** the trainer's training capacity. Additionally, the ith player can be matched with at most one trainer, and the jth trainer can be matched with at most one player.

Return *the **maximum** number of matchings between *players* and *trainers* that satisfy these conditions.*

 

Example 1:

```

**Input:** players = [4,7,9], trainers = [8,2,5,8]
**Output:** 2
**Explanation:**
One of the ways we can form two matchings is as follows:
- players[0] can be matched with trainers[0] since 4 <= 8.
- players[1] can be matched with trainers[3] since 7 <= 8.
It can be proven that 2 is the maximum number of matchings that can be formed.

```

Example 2:

```

**Input:** players = [1,1,1], trainers = [10]
**Output:** 1
**Explanation:**
The trainer can be matched with any of the 3 players.
Each player can only be matched with one trainer, so the maximum answer is 1.

```

 

**Constraints:**

	1 <= players.length, trainers.length <= 105
	1 <= players[i], trainers[j] <= 109

 

**Note:** This question is the same as [ 445: Assign Cookies.](https://leetcode.com/problems/assign-cookies/description/)

{% raw %}


```python


class Solution:
    def matchPlayersAndTrainers(self, players: List[int], trainers: List[int]) -> int:
        """
        there can be multiple possibilities to match, one of these will lead to max
        looking at const it appears greedy, than backtracking
        what if we match with someone just smallest possible, as larger ones
        will already be a match in case this matched
        sorting both of these seems doable
        after sorting it appears to be paran matching
        """
        arr =[]

        for i in players:
            arr.append((i,'p'))

        for i in trainers:
            arr.append((i,'t'))

        arr.sort(key=lambda x : x[0])

        st = []
        count = 0
        i = 0
        while(i < len(arr)):
            if st and st[-1][1] == 'p' and arr[i][1] == 't':
                st.pop()
                count += 1
                i += 1
            else:
                st.append(arr[i])
                i += 1
        return count
            




{% endraw %}
```
