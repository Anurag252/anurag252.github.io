---
            title: "1460 Number Of Substrings Containing All Three Characters"
            date: "2025-03-11T19:23:14+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Number of Substrings Containing All Three Characters](https://leetcode.com/problems/number-of-substrings-containing-all-three-characters) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given a string s consisting only of characters *a*, *b* and *c*.

Return the number of substrings containing **at least** one occurrence of all these characters *a*, *b* and *c*.

 

Example 1:

```

**Input:** s = "abcabc"
**Output:** 10
**Explanation:** The substrings containing at least one occurrence of the characters *a*, *b* and *c are "*abc*", "*abca*", "*abcab*", "*abcabc*", "*bca*", "*bcab*", "*bcabc*", "*cab*", "*cabc*" *and* "*abc*" *(**again**)*. *

```

Example 2:

```

**Input:** s = "aaacb"
**Output:** 3
**Explanation:** The substrings containing at least one occurrence of the characters *a*, *b* and *c are "*aaacb*", "*aacb*" *and* "*acb*".** *

```

Example 3:

```

**Input:** s = "abc"
**Output:** 1

```

 

**Constraints:**

	3 <= s.length <= 5 x 10^4
	s only consists of *a*, *b* or *c *characters.

{% raw %}
```python
class Solution:
    def numberOfSubstrings(self, s: str) -> int:
        # at least one occurence 
        # one way is that we could loop twice 
        # its too slow, how can we just loop once outside
        # all substr starting at i and fulfils the condt at j 
        # then s[i:j] -> end is the substr
        # we do not need to go till end and just need count if i and j
        # then len(s) - j + 1 for strings starting at i
        # so a sliding window , where we inc when till condition is satisfied and 
        # record the j 
        # then decrement the start by one and keep doing the same 

        left = 0
        right = 0
        a = 0
        b = 0
        c = 0
        res = []
        while(left < len(s)):
            #print(left, right, res)
            if a > 0 and b > 0 and c > 0:
                res.append(right)
                if s[left] == 'a':
                    a -= 1
                if s[left] == 'b':
                    b -= 1
                if s[left] == 'c':
                    c -= 1
                left += 1
            else:
                if right == len(s):
                    break
                if s[right] == 'a':
                    a += 1
                if s[right] == 'b':
                    b += 1
                if s[right] == 'c':
                    c += 1
                right += 1

        
        if a > 0 and b > 0 and c > 0:
                res.append(right)
        r = 0
        for k in res :
            r += (len(s) - k + 1)
        #print(res)
        return r

            


        
        
{% endraw %}
