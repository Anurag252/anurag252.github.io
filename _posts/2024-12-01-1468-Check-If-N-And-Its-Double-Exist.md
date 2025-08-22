---
title: "1468 Check If N And Its Double Exist"
date: "2024-12-01T10:44:02+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
---


                            ## [Check If N and Its Double Exist](https://leetcode.com/problems/check-if-n-and-its-double-exist) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

Given an array arr of integers, check if there exist two indices i and j such that :

	i != j
	0 <= i, j < arr.length
	arr[i] == 2 * arr[j]

 

Example 1:

```

**Input:** arr = [10,2,5,3]
**Output:** true
**Explanation:** For i = 0 and j = 2, arr[i] == 10 == 2 * 5 == 2 * arr[j]

```

Example 2:

```

**Input:** arr = [3,1,7,11]
**Output:** false
**Explanation:** There is no i and j that satisfy the conditions.

```

 

**Constraints:**

	2 <= arr.length <= 500
	-103 <= arr[i] <= 103

                            {% raw %}
                            ```python
                            class Solution:
    def checkIfExist(self, arr: List[int]) -> bool:
        dic = set()

        for k in arr:
            
            if k in dic:
                return True
            
            #print(dic)
            if k % 2 == 0: 
                dic.add(int(k//2))
            dic.add(k*2)
        
        return False



            

        
                            {% endraw %}
                            