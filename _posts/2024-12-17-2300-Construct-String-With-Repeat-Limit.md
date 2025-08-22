---
            title: "2300 Construct String With Repeat Limit"
            date: "2024-12-17T08:51:50+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Construct String With Repeat Limit](https://leetcode.com/problems/construct-string-with-repeat-limit) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a string s and an integer repeatLimit. Construct a new string repeatLimitedString using the characters of s such that no letter appears **more than** repeatLimit times **in a row**. You do **not** have to use all characters from s.

Return *the **lexicographically largest** *repeatLimitedString *possible*.

A string a is **lexicographically larger** than a string b if in the first position where a and b differ, string a has a letter that appears later in the alphabet than the corresponding letter in b. If the first min(a.length, b.length) characters do not differ, then the longer string is the lexicographically larger one.

 

Example 1:

```

**Input:** s = "cczazcc", repeatLimit = 3
**Output:** "zzcccac"
**Explanation:** We use all of the characters from s to construct the repeatLimitedString "zzcccac".
The letter 'a' appears at most 1 time in a row.
The letter 'c' appears at most 3 times in a row.
The letter 'z' appears at most 2 times in a row.
Hence, no letter appears more than repeatLimit times in a row and the string is a valid repeatLimitedString.
The string is the lexicographically largest repeatLimitedString possible so we return "zzcccac".
Note that the string "zzcccca" is lexicographically larger but the letter 'c' appears more than 3 times in a row, so it is not a valid repeatLimitedString.

```

Example 2:

```

**Input:** s = "aababab", repeatLimit = 2
**Output:** "bbabaa"
**Explanation:** We use only some of the characters from s to construct the repeatLimitedString "bbabaa". 
The letter 'a' appears at most 2 times in a row.
The letter 'b' appears at most 2 times in a row.
Hence, no letter appears more than repeatLimit times in a row and the string is a valid repeatLimitedString.
The string is the lexicographically largest repeatLimitedString possible so we return "bbabaa".
Note that the string "bbabaaa" is lexicographically larger but the letter 'a' appears more than 2 times in a row, so it is not a valid repeatLimitedString.

```

 

**Constraints:**

	1 <= repeatLimit <= s.length <= 105
	s consists of lowercase English letters.

{% raw %}
```python
class Solution:
    def repeatLimitedString(self, s: str, repeatLimit: int) -> str:
        freq = {}
        h = []



        for k in s:
            if k in freq:
                freq[k] += 1
            else:
                freq[k] = 1

        for k in freq.keys():
            heapq.heappush(h, -(ord(k)))

        prev = -1
        ls = []
        while(h):
            item1 = -heapq.heappop(h)
            if item1 == prev and h:
                item2 = -heapq.heappop(h)
                heapq.heappush(h, -item1) # push back item1

                prev = item2
                ls.append(chr(item2))
                freq[chr(item2)] -= 1
                if freq[chr(item2)] > 0:
                    heapq.heappush(h, -item2) # push next char just once


            elif item1 != prev:
                t = 0
                prev = item1
                while t < min(repeatLimit,freq[chr(item1)] ):
                    ls.append(chr(item1))
                    t += 1
                freq[chr(item1)] -= t
                if freq[chr(item1)] > 0:
                    heapq.heappush(h, -item1)
            else:
                break
        return "".join(ls)

            



        

        
{% endraw %}
