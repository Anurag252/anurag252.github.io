---
title: "455 Assign Cookies"
date: "2025-07-13T07:01:58+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
---


                            ## [Assign Cookies](https://leetcode.com/problems/assign-cookies) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

Assume you are an awesome parent and want to give your children some cookies. But, you should give each child at most one cookie.

Each child i has a greed factor g[i], which is the minimum size of a cookie that the child will be content with; and each cookie j has a size s[j]. If s[j] >= g[i], we can assign the cookie j to the child i, and the child i will be content. Your goal is to maximize the number of your content children and output the maximum number.

 

Example 1:

```

**Input:** g = [1,2,3], s = [1,1]
**Output:** 1
**Explanation:** You have 3 children and 2 cookies. The greed factors of 3 children are 1, 2, 3. 
And even though you have 2 cookies, since their size is both 1, you could only make the child whose greed factor is 1 content.
You need to output 1.

```

Example 2:

```

**Input:** g = [1,2], s = [1,2,3]
**Output:** 2
**Explanation:** You have 2 children and 3 cookies. The greed factors of 2 children are 1, 2. 
You have 3 cookies and their sizes are big enough to gratify all of the children, 
You need to output 2.

```

 

**Constraints:**

	1 <= g.length <= 3 * 104
	0 <= s.length <= 3 * 104
	1 <= g[i], s[j] <= 231 - 1

 

**Note:** This question is the same as [ 2410: Maximum Matching of Players With Trainers.](https://leetcode.com/problems/maximum-matching-of-players-with-trainers/description/)

                            {% raw %}
                            ```python
                            class Solution:
    def findContentChildren(self, players: List[int], trainers: List[int]) -> int:
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
                            