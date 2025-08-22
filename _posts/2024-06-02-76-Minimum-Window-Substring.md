---
            title: "76 Minimum Window Substring"
            date: "2024-06-02T23:56:09+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Minimum Window Substring](https://leetcode.com/problems/minimum-window-substring) ![image](https://img.shields.io/badge/Difficulty-Hard-red)

Given two strings s and t of lengths m and n respectively, return *the **minimum window*** ***substring**** of *s* such that every character in *t* (**including duplicates**) is included in the window*. If there is no such substring, return *the empty string *"".

The testcases will be generated such that the answer is **unique**.

 

Example 1:

```

**Input:** s = "ADOBECODEBANC", t = "ABC"
**Output:** "BANC"
**Explanation:** The minimum window substring "BANC" includes 'A', 'B', and 'C' from string t.

```

Example 2:

```

**Input:** s = "a", t = "a"
**Output:** "a"
**Explanation:** The entire string s is the minimum window.

```

Example 3:

```

**Input:** s = "a", t = "aa"
**Output:** ""
**Explanation:** Both 'a's from t must be included in the window.
Since the largest window of s only has one 'a', return empty string.

```

 

**Constraints:**

	m == s.length
	n == t.length
	1 <= m, n <= 105
	s and t consist of uppercase and lowercase English letters.

 

**Follow up:** Could you find an algorithm that runs in O(m + n) time?

{% raw %}


```python


class Solution:
    def minWindow(self, s: str, t: str) -> str:
        if not t or not s:
            return ""
        
        from collections import Counter
        
        t_count = Counter(t)
        current_count = Counter()
        
        start = 0
        min_len = float('inf')
        min_start = 0
        
        required = len(t_count)
        formed = 0
        
        l, r = 0, 0
        
        while r < len(s):
            character = s[r]
            current_count[character] += 1
            
            if character in t_count and current_count[character] == t_count[character]:
                formed += 1
            
            while l <= r and formed == required:
                character = s[l]
                
                if r - l + 1 < min_len:
                    min_len = r - l + 1
                    min_start = l
                
                current_count[character] -= 1
                if character in t_count and current_count[character] < t_count[character]:
                    formed -= 1
                
                l += 1
            
            r += 1
        
        if min_len == float('inf'):
            return ""
        else:
            return s[min_start:min_start + min_len]

                                       
    def contains(self, k : str, ls : [int]) -> bool:
        if k.isupper():
                return ls[ord(k)-65] != 5000
        else:
                return ls[ord(k.upper())-39] != 5000

    def reduce(self, k : str, ls : [int] ) -> [int]:
        if k.isupper():
                ls[ord(k)-65] = ls[ord(k)-65]  - 1
        else:
                ls[ord(k.upper())-39] = ls[ord(k.upper())-39]  - 1
        return ls

    def increase(self, k : str, ls : [int] ) -> [int]:
        if k.isupper():
                ls[ord(k)-65] = ls[ord(k)-65]  + 1
        else:
                ls[ord(k.upper())-39] = ls[ord(k.upper())-39]  + 1
        return ls


    def get(self, k : str, ls : [int]) -> int:
        if k.isupper():
                return ls[ord(k)-65]
        else:
                return ls[ord(k.upper())-39]
    
    def is_complete(self, s : str, ls : [int]) -> bool:
        for k in s:
            if k.isupper():
                
                if not ls[ord(k)-65] <= 0:
                    return False
            else:
                print(s, False)
                if not ls[ord(k.upper())-39] <= 0:
                        return False
        return True

        


{% endraw %}
