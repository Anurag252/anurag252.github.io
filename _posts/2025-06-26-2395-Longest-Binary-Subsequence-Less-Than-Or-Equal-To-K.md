---
            title: "2395 Longest Binary Subsequence Less Than Or Equal To K"
            date: "2025-06-26T09:46:11+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Longest Binary Subsequence Less Than or Equal to K](https://leetcode.com/problems/longest-binary-subsequence-less-than-or-equal-to-k) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a binary string s and a positive integer k.

Return *the length of the **longest** subsequence of *s* that makes up a **binary** number less than or equal to* k.

Note:

	The subsequence can contain **leading zeroes**.
	The empty string is considered to be equal to 0.
	A **subsequence** is a string that can be derived from another string by deleting some or no characters without changing the order of the remaining characters.

 

Example 1:

```

**Input:** s = "1001010", k = 5
**Output:** 5
**Explanation:** The longest subsequence of s that makes up a binary number less than or equal to 5 is "00010", as this number is equal to 2 in decimal.
Note that "00100" and "00101" are also possible, which are equal to 4 and 5 in decimal, respectively.
The length of this subsequence is 5, so 5 is returned.

```

Example 2:

```

**Input:** s = "00101001", k = 1
**Output:** 6
**Explanation:** "000001" is the longest subsequence of s that makes up a binary number less than or equal to 1, as this number is equal to 1 in decimal.
The length of this subsequence is 6, so 6 is returned.

```

 

**Constraints:**

	1 <= s.length <= 1000
	s[i] is either '0' or '1'.
	1 <= k <= 109

{% raw %}


```python


class Solution:
    def longestSubsequence(self, s: str, k: int) -> int:
        """
        we find the number and attach leading zeros
        the problem is we can have multiple such numbers, so we find the right most 
        number
        so essentially we find a rightmost subsequence that matches 
        k
        did not understand Q correctly, basically take all 0s
        and then take as many ones as possible
        is it possible that a zero can be left out and still get ans ? No
        as a zero before all ones must be taken and a zero after 1 cannot help get 2 1s
        """
        arr =[]
        m = k
        while(m > 0):
            arr.append(m % 2)
            m //= 2
        a = int("".join(map(str, arr[::-1])), 2)
        
        arr1 = []
        last_indx = len(s)
        for  k1 in s[::-1]:
            last_indx -= 1
            if k1 == "0":
                arr1.append(k1)
            elif k1 == "1":
                if len(arr1) > 0:
                    n = int("1" + "".join(map(str, arr1[::-1])), 2)
                else:
                    n = 0
                if n <= a:
                    arr1.append(k1)
                else:
                    break
        
        z = len(arr1)
        for k1 in s[:last_indx]:
            if k1 == "0":
                z += 1
        
        
        return z
        
        



        


{% endraw %}
