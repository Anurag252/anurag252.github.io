---
            title: "3018 Make String A Subsequence Using Cyclic Increments"
            date: "2024-12-04T15:14:42+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Make String a Subsequence Using Cyclic Increments](https://leetcode.com/problems/make-string-a-subsequence-using-cyclic-increments) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given two **0-indexed** strings str1 and str2.

In an operation, you select a **set** of indices in str1, and for each index i in the set, increment str1[i] to the next character **cyclically**. That is 'a' becomes 'b', 'b' becomes 'c', and so on, and 'z' becomes 'a'.

Return true *if it is possible to make *str2 *a subsequence of *str1 *by performing the operation **at most once***, *and* false *otherwise*.

**Note:** A subsequence of a string is a new string that is formed from the original string by deleting some (possibly none) of the characters without disturbing the relative positions of the remaining characters.

 

Example 1:

```

**Input:** str1 = "abc", str2 = "ad"
**Output:** true
**Explanation:** Select index 2 in str1.
Increment str1[2] to become 'd'. 
Hence, str1 becomes "abd" and str2 is now a subsequence. Therefore, true is returned.
```

Example 2:

```

**Input:** str1 = "zc", str2 = "ad"
**Output:** true
**Explanation:** Select indices 0 and 1 in str1. 
Increment str1[0] to become 'a'. 
Increment str1[1] to become 'd'. 
Hence, str1 becomes "ad" and str2 is now a subsequence. Therefore, true is returned.
```

Example 3:

```

**Input:** str1 = "ab", str2 = "d"
**Output:** false
**Explanation:** In this example, it can be shown that it is impossible to make str2 a subsequence of str1 using the operation at most once. 
Therefore, false is returned.
```

 

**Constraints:**

	1 <= str1.length <= 105
	1 <= str2.length <= 105
	str1 and str2 consist of only lowercase English letters.

{% raw %}


```python


class Solution:
    def canMakeSubsequence(self, s1: str, s2: str) -> bool:
        arr = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','a']

        idx1 = 0
        idx2 = 0
        while(True):
            #print(s1, s2)
           
            if s1[idx1:] == s2[idx2:]:
                return True
            if len(s2[idx2:]) == 0:
                return True
            if len(s1[idx1:]) < len(s2[idx2:]):
                return False
            k1 = s1[idx1]
            k2 = s2[idx2]

           
            if k1 != k2 and arr[ord(k1) - 97 + 1] != arr[ord(k2) - 97]:
                    idx1 += 1
                    continue # skip the char

            if k1 == k2  :
                    idx1 += 1
                    idx2 += 1
                    continue
                #print(arr[ord(k1) - 97 + 1] , arr[ord(k2) - 97])
            if arr[ord(k1) - 97 + 1] == arr[ord(k2) - 97] :
                    idx1 += 1
                    idx2 += 1
                    continue
        


                






{% endraw %}
