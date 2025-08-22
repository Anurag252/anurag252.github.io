---
title: "1744 Number Of Ways To Form A Target String Given A Dictionary"
date: "2024-12-29T10:39:46+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
---


                            ## [Number of Ways to Form a Target String Given a Dictionary](https://leetcode.com/problems/number-of-ways-to-form-a-target-string-given-a-dictionary) ![image](https://img.shields.io/badge/Difficulty-Hard-red)

You are given a list of strings of the **same length** words and a string target.

Your task is to form target using the given words under the following rules:

	target should be formed from left to right.
	To form the ith character (**0-indexed**) of target, you can choose the kth character of the jth string in words if target[i] = words[j][k].
	Once you use the kth character of the jth string of words, you **can no longer** use the xth character of any string in words where x <= k. In other words, all characters to the left of or at index k become unusuable for every string.
	Repeat the process until you form the string target.

**Notice** that you can use **multiple characters** from the **same string** in words provided the conditions above are met.

Return *the number of ways to form target from words*. Since the answer may be too large, return it **modulo** 109 + 7.

 

Example 1:

```

**Input:** words = ["acca","bbbb","caca"], target = "aba"
**Output:** 6
**Explanation:** There are 6 ways to form target.
"aba" -> index 0 ("acca"), index 1 ("bbbb"), index 3 ("caca")
"aba" -> index 0 ("acca"), index 2 ("bbbb"), index 3 ("caca")
"aba" -> index 0 ("acca"), index 1 ("bbbb"), index 3 ("acca")
"aba" -> index 0 ("acca"), index 2 ("bbbb"), index 3 ("acca")
"aba" -> index 1 ("caca"), index 2 ("bbbb"), index 3 ("acca")
"aba" -> index 1 ("caca"), index 2 ("bbbb"), index 3 ("caca")

```

Example 2:

```

**Input:** words = ["abba","baab"], target = "bab"
**Output:** 4
**Explanation:** There are 4 ways to form target.
"bab" -> index 0 ("baab"), index 1 ("baab"), index 2 ("abba")
"bab" -> index 0 ("baab"), index 1 ("baab"), index 3 ("baab")
"bab" -> index 0 ("baab"), index 2 ("baab"), index 3 ("baab")
"bab" -> index 1 ("abba"), index 2 ("baab"), index 3 ("baab")

```

 

**Constraints:**

	1 <= words.length <= 1000
	1 <= words[i].length <= 1000
	All strings in words have the same length.
	1 <= target.length <= 1000
	words[i] and target contain only lowercase English letters.

                            {% raw %}
                            ```python
                            class Solution:
    def numWays(self, words: List[str], target: str) -> int:
        
        freq = {}
        l = len(words[0])
        i = 0
        while(i < l):
            s = {}
            for k in words:
                if k[i] in s:
                    s[k[i]] += 1
                else:
                    s[k[i]] = 1
            freq[i] = s
            i += 1
        print(freq)
        
        # time complexity 
        # n words m length each = n * m
        # T[i,j,k] = 1 + T[i,j-1,k-1] if a[j] == target[k] in any string
        
        dp = [[0 for _ in range(len(target) + 1)] for _ in range(l + 1)]
        print(dp)
        # Base case: If the target length is 0, there's exactly 1 way to match it
        for i in range(l + 1):
            dp[i][0] = 1
        for i in range(1, l + 1):  # Iterate over columns in `freq`
            for j in range(1, len(target) + 1):  # Iterate over characters in `target`
        # Carry over the previous value (skip the current column)
                dp[i][j] = dp[i - 1][j]
        
        # If the current character matches and exists in freq[i - 1]
                if target[j - 1] in freq[i - 1]:
                    dp[i][j] += dp[i - 1][j - 1] * freq[i - 1][target[j - 1]]
        
            dp[i][j] %= (10 ** 9 + 7)  # Keep values modulo 10^9 + 7
        return dp[l][len(target)]



        @cache
        def recurse(idx, target, occ):
            if len(target) == 0:
                return occ
            result = 0
            i = idx
            while(i < l):
                if target[0] in freq[i]:
                    result += recurse(i+1, target[1:], occ * freq[i][target[0]])
                i += 1
            return result
        return recurse(0,target, 1) % (10 ** 9 + 7)
                            {% endraw %}
                            