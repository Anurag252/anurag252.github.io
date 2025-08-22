---
title: "3309 Count Prefix And Suffix Pairs I"
date: "2025-01-08T07:55:47+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
---


                            ## [Count Prefix and Suffix Pairs I](https://leetcode.com/problems/count-prefix-and-suffix-pairs-i) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

You are given a **0-indexed** string array words.

Let's define a **boolean** function isPrefixAndSuffix that takes two strings, str1 and str2:

	isPrefixAndSuffix(str1, str2) returns true if str1 is **both** a prefix and a suffix of str2, and false otherwise.

For example, isPrefixAndSuffix("aba", "ababa") is true because "aba" is a prefix of "ababa" and also a suffix, but isPrefixAndSuffix("abc", "abcd") is false.

Return *an integer denoting the **number** of index pairs *(i, j)* such that *i < j*, and *isPrefixAndSuffix(words[i], words[j])* is *true*.*

 

Example 1:

```

**Input:** words = ["a","aba","ababa","aa"]
**Output:** 4
**Explanation:** In this example, the counted index pairs are:
i = 0 and j = 1 because isPrefixAndSuffix("a", "aba") is true.
i = 0 and j = 2 because isPrefixAndSuffix("a", "ababa") is true.
i = 0 and j = 3 because isPrefixAndSuffix("a", "aa") is true.
i = 1 and j = 2 because isPrefixAndSuffix("aba", "ababa") is true.
Therefore, the answer is 4.
```

Example 2:

```

**Input:** words = ["pa","papa","ma","mama"]
**Output:** 2
**Explanation:** In this example, the counted index pairs are:
i = 0 and j = 1 because isPrefixAndSuffix("pa", "papa") is true.
i = 2 and j = 3 because isPrefixAndSuffix("ma", "mama") is true.
Therefore, the answer is 2.  
```

Example 3:

```

**Input:** words = ["abab","ab"]
**Output:** 0
**Explanation: **In this example, the only valid index pair is i = 0 and j = 1, and isPrefixAndSuffix("abab", "ab") is false.
Therefore, the answer is 0.
```

 

**Constraints:**

	1 <= words.length <= 50
	1 <= words[i].length <= 10
	words[i] consists only of lowercase English letters.

                            {% raw %}
                            ```python
                            class Solution:
    def countPrefixSuffixPairs(self, words: List[str]) -> int:

        res = 0

        def starts_with(s1, s2):
            if len(s1) > len(s2):
                return False
            for a1, a2 in zip(s1, s2):
                if a1 != a2:
                    return False
            return True

        def ends_with(s1, s2):
            if len(s1) > len(s2):
                return False
            i = len(s1) - 1
            j = len(s2) - 1
            while(i >= 0 and j >= 0):
                if s1[i] != s2[j]:
                    return False
                i -= 1
                j -= 1
            return True

        for idx1, k1 in enumerate(words):
            for idx2, k2 in enumerate(words[idx1+1:]):
                if starts_with(k1,k2) and ends_with(k1, k2):
                    res += 1
        return res


        
                            {% endraw %}
                            