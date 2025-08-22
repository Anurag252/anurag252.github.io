---
            title: "3267 Find Longest Special Substring That Occurs Thrice I"
            date: "2024-12-10T08:27:33+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Find Longest Special Substring That Occurs Thrice I](https://leetcode.com/problems/find-longest-special-substring-that-occurs-thrice-i) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a string s that consists of lowercase English letters.

A string is called **special** if it is made up of only a single character. For example, the string "abc" is not special, whereas the strings "ddd", "zz", and "f" are special.

Return *the length of the **longest special substring** of *s *which occurs **at least thrice***, *or *-1* if no special substring occurs at least thrice*.

A **substring** is a contiguous **non-empty** sequence of characters within a string.

 

Example 1:

```

**Input:** s = "aaaa"
**Output:** 2
**Explanation:** The longest special substring which occurs thrice is "aa": substrings "**aa**aa", "a**aa**a", and "aa**aa**".
It can be shown that the maximum length achievable is 2.

```

Example 2:

```

**Input:** s = "abcdef"
**Output:** -1
**Explanation:** There exists no special substring which occurs at least thrice. Hence return -1.

```

Example 3:

```

**Input:** s = "abcaba"
**Output:** 1
**Explanation:** The longest special substring which occurs thrice is "a": substrings "**a**bcaba", "abc**a**ba", and "abcab**a**".
It can be shown that the maximum length achievable is 1.

```

 

**Constraints:**

	3 <= s.length <= 50
	s consists of only lowercase English letters.

{% raw %}
```python
class Solution:
    def maximumLength(self, s: str) -> int:
        freq = [0] * 26
        for k in s:
            freq[ord(k) - 97] += 1
        #print(freq)
        

        @cache
        def find_occur(s1, s2):
            #print(s1, s2)
            for k in s1:
                if k != s1[0]:
                    return 0
            i = 0
            j = 0
            res = 0
            while(i < len(s2)):
                if s2[i] == s1[j]:
                    t1 = i
                    t2 = j
                    while(t1 < len(s2) and t2 < len(s1) and s2[t1] == s1[t2]):
                        t1 += 1
                        t2 += 1
                    if t2 == len(s1):
                        res += 1
                    i += 1
                    j = 0
                else:
                    i += 1
            return res


        i = 0
        ans = -1
        temp = 0
        while(i < len(s)):
            if freq[ord(s[i])-97] >= 3:
                j = i + 1
                while(j <= len(s)):
                    if find_occur(s[i:j], s) >= 3:
                        #print(s[i:j], j - i)
                        temp = j - i
                        j += 1
                    else:
                        break
                if temp > 0:
                    ans = max(ans, temp)
            else:
                if temp > 0:
                    ans = max(ans, temp)
                temp = 0
            i += 1
        return ans 

    #aaaa
{% endraw %}
