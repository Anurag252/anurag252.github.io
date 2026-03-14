---
            title: "1516 The K Th Lexicographical String Of All Happy Strings Of Length N"
            date: "2026-03-14T21:46:40+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [The k-th Lexicographical String of All Happy Strings of Length n](https://leetcode.com/problems/the-k-th-lexicographical-string-of-all-happy-strings-of-length-n) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

A **happy string** is a string that:

	consists only of letters of the set ['a', 'b', 'c'].
	s[i] != s[i + 1] for all values of i from 1 to s.length - 1 (string is 1-indexed).

For example, strings **"abc", "ac", "b"** and **"abcbabcbcb"** are all happy strings and strings **"aa", "baa"** and **"ababbc"** are not happy strings.

Given two integers n and k, consider a list of all happy strings of length n sorted in lexicographical order.

Return *the kth string* of this list or return an **empty string** if there are less than k happy strings of length n.

 

Example 1:

```

**Input:** n = 1, k = 3
**Output:** "c"
**Explanation:** The list ["a", "b", "c"] contains all happy strings of length 1. The third string is "c".

```

Example 2:

```

**Input:** n = 1, k = 4
**Output:** ""
**Explanation:** There are only 3 happy strings of length 1.

```

Example 3:

```

**Input:** n = 3, k = 9
**Output:** "cab"
**Explanation:** There are 12 different happy string of length 3 ["aba", "abc", "aca", "acb", "bab", "bac", "bca", "bcb", "cab", "cac", "cba", "cbc"]. You will find the 9th string = "cab"

```

 

**Constraints:**

	1 <= n <= 10
	1 <= k <= 100

{% raw %}


```python


class Solution:
    def getHappyString(self, n: int, k: int) -> str:
        """
            a ab abc abca abcb abcab abcac abcaba abcabc abcaca abcacb
        """

        def recurse(s , n):
            if n == 0:
                return [s]
            res = []
            a1 , a2, a3 = [] , [], []
            if s == "":
                a1 = recurse( "a" , n - 1)
                a2 = recurse( "b" , n - 1)
                a3 = recurse( "c" , n - 1)
                
                
            if len(s) > 0 and s[-1] == "a":
                a1 = recurse( s + "b" , n - 1)
                a2 = recurse( s + "c" , n - 1)

            if len(s) > 0 and s[-1] == "b":
                a1 = recurse( s + "a" , n - 1)
                a2 = recurse( s + "c" , n - 1)

            if len(s) > 0 and s[-1] == "c":
                a1 = recurse( s + "a" , n - 1)
                a2 = recurse( s + "b" , n - 1)
            
            for n in a1:
                res.append(n)

            for n in a2:
                res.append(n)

            for n in a3:
                res.append(n)
            return res
        x = recurse("", n)
        #print(x)
        return x[k-1] if k-1 < len(x) else ""
                


{% endraw %}
```
