---
            title: "2887 Sort Vowels In A String"
            date: "2025-09-11T21:59:25+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Sort Vowels in a String](https://leetcode.com/problems/sort-vowels-in-a-string) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given a **0-indexed** string s, **permute** s to get a new string t such that:

	All consonants remain in their original places. More formally, if there is an index i with 0 <= i < s.length such that s[i] is a consonant, then t[i] = s[i].
	The vowels must be sorted in the **nondecreasing** order of their **ASCII** values. More formally, for pairs of indices i, j with 0 <= i < j < s.length such that s[i] and s[j] are vowels, then t[i] must not have a higher ASCII value than t[j].

Return *the resulting string*.

The vowels are 'a', 'e', 'i', 'o', and 'u', and they can appear in lowercase or uppercase. Consonants comprise all letters that are not vowels.

 

Example 1:

```

**Input:** s = "lEetcOde"
**Output:** "lEOtcede"
**Explanation:** 'E', 'O', and 'e' are the vowels in s; 'l', 't', 'c', and 'd' are all consonants. The vowels are sorted according to their ASCII values, and the consonants remain in the same places.

```

Example 2:

```

**Input:** s = "lYmpH"
**Output:** "lYmpH"
**Explanation:** There are no vowels in s (all characters in s are consonants), so we return "lYmpH".

```

 

**Constraints:**

	1 <= s.length <= 105
	s consists only of letters of the English alphabet in **uppercase and lowercase**.

{% raw %}


```python


class Solution:
    def sortVowels(self, s1: str) -> str:
        mp = [0] * 10 # AEIOUaeiou
        s = {}
        s['A'] = 0
        s['E'] = 1
        s['I'] = 2
        s['O'] = 3
        s['U'] = 4
        s['a'] = 5
        s['e'] = 6
        s['i'] = 7
        s['o'] = 8
        s['u'] = 9

    
        for k in s1:
            if k in s:
                if k == "A":
                    mp[0] += 1
                if k == "E":
                    mp[1] += 1
                if k == "I":
                    mp[2] += 1
                if k == "O":
                    mp[3] += 1
                if k == "U":
                    mp[4] += 1
                if k == "a":
                    mp[5] += 1
                if k == "e":
                    mp[6] += 1
                if k == "i":
                    mp[7] += 1
                if k == "o":
                    mp[8] += 1
                if k == "u":
                    mp[9] += 1

        s2 = ""
        
        for i,k in enumerate(s1):
            filled = False
            if k in s:
                for j, m in enumerate(mp):
                    if m > 0:
                        mp[j] -= 1
                        for k1,v in s.items():
                            if v == j:
                                s2 += k1
                                filled = True
                                break
                        break
            if not filled:
                s2 += k
        return s2

                





{% endraw %}
```
