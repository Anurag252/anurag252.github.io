---
title: "3360 Minimum Deletions To Make String K Special"
date: "2025-06-21T15:04:34+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
---

## [Minimum Deletions to Make String K-Special](https://leetcode.com/problems/minimum-deletions-to-make-string-k-special) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a string word and an integer k.

We consider word to be **k-special** if |freq(word[i]) - freq(word[j])| <= k for all indices i and j in the string.

Here, freq(x) denotes the frequency of the character x in word, and |y| denotes the absolute value of y.

Return *the **minimum** number of characters you need to delete to make* word ***k-special***.

 

Example 1:

**Input: **word = "aabcaba", k = 0

**Output: **3

**Explanation:** We can make word 0-special by deleting 2 occurrences of "a" and 1 occurrence of "c". Therefore, word becomes equal to "baba" where freq('a') == freq('b') == 2.

Example 2:

**Input: **word = "dabdcbdcdcd", k = 2

**Output: **2

**Explanation:** We can make word 2-special by deleting 1 occurrence of "a" and 1 occurrence of "d". Therefore, word becomes equal to "bdcbdcdcd" where freq('b') == 2, freq('c') == 3, and freq('d') == 4.

Example 3:

**Input: **word = "aaabaaa", k = 2

**Output: **1

**Explanation:** We can make word 2-special by deleting 1 occurrence of "b". Therefore, word becomes equal to "aaaaaa" where each letter's frequency is now uniformly 6.

 

**Constraints:**

	1 <= word.length <= 105
	0 <= k <= 105
	word consists only of lowercase English letters.

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