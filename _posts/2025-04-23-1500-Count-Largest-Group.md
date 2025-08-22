---
            title: "1500 Count Largest Group"
            date: "2025-04-23T06:49:00+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
            ---
            

            ## [Count Largest Group](https://leetcode.com/problems/count-largest-group) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

You are given an integer n.

Each number from 1 to n is grouped according to the sum of its digits.

Return *the number of groups that have the largest size*.

 

Example 1:

```

**Input:** n = 13
**Output:** 4
**Explanation:** There are 9 groups in total, they are grouped according sum of its digits of numbers from 1 to 13:
[1,10], [2,11], [3,12], [4,13], [5], [6], [7], [8], [9].
There are 4 groups with largest size.

```

Example 2:

```

**Input:** n = 2
**Output:** 2
**Explanation:** There are 2 groups [1], [2] of size 1.

```

 

**Constraints:**

	1 <= n <= 104

            {% raw %}
            ```python
            class Solution:
    def countLargestGroup(self, n: int) -> int:
        mp = {}

        for k in range(1,n+1):
            m = k
            res = 0
            while(k > 0):
                res += (k % 10)
                k = k // 10
            #print(res, k)
            if res in mp:
                mp[res].append(m)
            else:
                mp[res] = []
                mp[res].append(m)
        l  = 0
        print(mp)
        for k in mp:
            if len(mp[k]) > l:
                l = len(mp[k])
        ans = 0
        for k in mp:
            if len(mp[k]) == l:
                ans += 1

        return ans


        
            {% endraw %}
            