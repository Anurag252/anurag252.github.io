---
title: "2280 Count Good Triplets In An Array"
date: "2025-04-15T22:07:51+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
---


                            ## [Count Good Triplets in an Array](https://leetcode.com/problems/count-good-triplets-in-an-array) ![image](https://img.shields.io/badge/Difficulty-Hard-red)

You are given two **0-indexed** arrays nums1 and nums2 of length n, both of which are **permutations** of [0, 1, ..., n - 1].

A **good triplet** is a set of 3 **distinct** values which are present in **increasing order** by position both in nums1 and nums2. In other words, if we consider pos1v as the index of the value v in nums1 and pos2v as the index of the value v in nums2, then a good triplet will be a set (x, y, z) where 0 <= x, y, z <= n - 1, such that pos1x < pos1y < pos1z and pos2x < pos2y < pos2z.

Return *the **total number** of good triplets*.

 

Example 1:

```

**Input:** nums1 = [2,0,1,3], nums2 = [0,1,2,3]
**Output:** 1
**Explanation:** 
There are 4 triplets (x,y,z) such that pos1x y z. They are (2,0,1), (2,0,3), (2,1,3), and (0,1,3). 
Out of those triplets, only the triplet (0,1,3) satisfies pos2x y z. Hence, there is only 1 good triplet.

```

Example 2:

```

**Input:** nums1 = [4,0,1,3,2], nums2 = [4,1,0,2,3]
**Output:** 4
**Explanation:** The 4 good triplets are (4,0,3), (4,0,2), (4,1,3), and (4,1,2).

```

 

**Constraints:**

	n == nums1.length == nums2.length
	3 <= n <= 105
	0 <= nums1[i], nums2[i] <= n - 1
	nums1 and nums2 are permutations of [0, 1, ..., n - 1].

                            {% raw %}
                            ```python
                            class FenwickTree:
    def __init__(self, size):
        self.tree = [0] * (size + 1)

    def update(self, index, delta):
        index += 1
        while index <= len(self.tree) - 1:
            self.tree[index] += delta
            index += index & -index

    def query(self, index):
        index += 1
        res = 0
        while index > 0:
            res += self.tree[index]
            index -= index & -index
        return res


class Solution:
    def goodTriplets(self, nums1: List[int], nums2: List[int]) -> int:
        n = len(nums1)
        pos2, reversedIndexMapping = [0] * n, [0] * n
        for i, num2 in enumerate(nums2):
            pos2[num2] = i
        for i, num1 in enumerate(nums1):
            reversedIndexMapping[pos2[num1]] = i
        tree = FenwickTree(n)
        res = 0
        for value in range(n):
            pos = reversedIndexMapping[value]
            left = tree.query(pos)
            tree.update(pos, 1)
            right = (n - 1 - pos) - (value - left)
            res += left * right
        return res
                            {% endraw %}
                            