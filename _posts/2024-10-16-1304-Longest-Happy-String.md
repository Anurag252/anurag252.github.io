---
title: "1304 Longest Happy String"
date: "2024-10-16T08:34:31+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
---

## [Longest Happy String](https://leetcode.com/problems/longest-happy-string) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

A string s is called **happy** if it satisfies the following conditions:

	s only contains the letters 'a', 'b', and 'c'.
	s does not contain any of "aaa", "bbb", or "ccc" as a substring.
	s contains **at most** a occurrences of the letter 'a'.
	s contains **at most** b occurrences of the letter 'b'.
	s contains **at most** c occurrences of the letter 'c'.

Given three integers a, b, and c, return *the **longest possible happy **string*. If there are multiple longest happy strings, return *any of them*. If there is no such string, return *the empty string *"".

A **substring** is a contiguous sequence of characters within a string.

 

Example 1:

```

**Input:** a = 1, b = 1, c = 7
**Output:** "ccaccbcc"
**Explanation:** "ccbccacc" would also be a correct answer.

```

Example 2:

```

**Input:** a = 7, b = 1, c = 0
**Output:** "aabaa"
**Explanation:** It is the only correct answer in this case.

```

 

**Constraints:**

	0 <= a, b, c <= 100
	a + b + c > 0

```python
class Solution:
    def longestDiverseString(self, a: int, b: int, c: int) -> str:



        def test(a,b,c, d):
            if (a == 0 and b == 0 and d == "c") or (b == 0 and c == 0 and d == "a") or (c== 0 and a == 0 and d == "b"):
                return ""


            arr = [(a, "a"),(b, "b"),(c, "c")]
            arr.sort(key = lambda x : x[0])

            (k,l) = arr[2] if d != arr[2][1] else arr[1]
            is_max = True
            if k != arr[2][0]:
                is_max = False

            #print(arr,d)

            if l == "a" :
                if is_max:
                    return "a"*min(2,k) + test(a - min(2,k) , b, c, "a")
                else:
                    return "a" + test(a - 1 , b, c, "a")


            if l == "b":
                if is_max:
                    return "b"*min(2,k) + test(a  , b - min(2,k), c, "b")
                else:
                    return "b" + test(a  , b - 1, c, "b")


            if l == "c":
                if is_max:
                    return "c"*min(2,k) + test(a  , b, c - min(2,k), "c")
                else:
                    return "c" + test(a  , b, c - 1, "c")

        return test(a,b,c, "")
            
        '''
        3,3,3
        aacbbccba
        bbccbc
        aabaccbcb
        '''
        
```