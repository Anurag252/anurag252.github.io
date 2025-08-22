---
title: "Minimum Deletions To Make String K Special"
date: "2025-06-21T15:04:34+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 104 ms (12.40%) | Memory: 18.4 MB (4.65%) - LeetSync"
---

```python
class Solution:
    def minimumDeletions(self, word: str, k: int) -> int:
        mp = {}

        for ch in word:
            if ch in mp:
                mp[ch] += 1
            else:
                mp[ch] = 1

        arr = []
        for _, v in mp.items():
            arr.append(v)

        arr.sort()
        n = len(arr)

        # Prefix sum: pref[i] = sum of arr[0..i-1]
        pref = [0] * (n + 1)
        for i in range(n):
            pref[i + 1] = pref[i] + arr[i]

        # Suffix sum: suff[i] = sum of arr[i..n-1]
        suff = [0] * (n + 1)
        for i in range(n - 1, -1, -1):
            suff[i] = suff[i + 1] + arr[i]

        # Binary search for first index with value > pivot
        def greater_pivot(pivot):
            low, high = 0, n
            while low < high:
                mid = (low + high) // 2
                if arr[mid] > pivot:
                    high = mid
                else:
                    low = mid + 1
            return low

        # Binary search for first index with value >= pivot
        def lesser_pivot(pivot):
            low, high = 0, n
            while low < high:
                mid = (low + high) // 2
                if arr[mid] < pivot:
                    low = mid + 1
                else:
                    high = mid
            return low

        res = 1000000
        print(arr)
        for i, m in enumerate(arr):
            rpivot = m + k
            nums1 = greater_pivot(rpivot)  # all > rpivot
            
            if i > 0:
                a = pref[i]                # delete low freq
            else:
                a = 0
            b = suff[nums1]                # delete high freq
            num_of_elements_grt = len(arr) - nums1
            
            #print(nums1, a, b, num_of_elements_grt)
            res = min(res,  a + b - (num_of_elements_grt*(m+k)))

        return res

```