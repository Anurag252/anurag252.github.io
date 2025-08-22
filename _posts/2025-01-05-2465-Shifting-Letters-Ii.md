---
            title: "2465 Shifting Letters Ii"
            date: "2025-01-05T07:32:46+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
            ---
            

            ## [Shifting Letters II](https://leetcode.com/problems/shifting-letters-ii) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a string s of lowercase English letters and a 2D integer array shifts where shifts[i] = [starti, endi, directioni]. For every i, **shift** the characters in s from the index starti to the index endi (**inclusive**) forward if directioni = 1, or shift the characters backward if directioni = 0.

Shifting a character **forward** means replacing it with the **next** letter in the alphabet (wrapping around so that 'z' becomes 'a'). Similarly, shifting a character **backward** means replacing it with the **previous** letter in the alphabet (wrapping around so that 'a' becomes 'z').

Return *the final string after all such shifts to *s* are applied*.

 

Example 1:

```

**Input:** s = "abc", shifts = [[0,1,0],[1,2,1],[0,2,1]]
**Output:** "ace"
**Explanation:** Firstly, shift the characters from index 0 to index 1 backward. Now s = "zac".
Secondly, shift the characters from index 1 to index 2 forward. Now s = "zbd".
Finally, shift the characters from index 0 to index 2 forward. Now s = "ace".
```

Example 2:

```

**Input:** s = "dztz", shifts = [[0,0,0],[1,1,1]]
**Output:** "catz"
**Explanation:** Firstly, shift the characters from index 0 to index 0 backward. Now s = "cztz".
Finally, shift the characters from index 1 to index 1 forward. Now s = "catz".

```

 

**Constraints:**

	1 <= s.length, shifts.length <= 5 * 104
	shifts[i].length == 3
	0 <= starti <= endi < s.length
	0 <= directioni <= 1
	s consists of lowercase English letters.

            {% raw %}
            ```python
            class Solution:
    def shiftingLetters(self, s: str, shifts: List[List[int]]) -> str:
        arr = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']

        arr1 = [0] * (len(s)+1)
        s1 = []

        shifts.sort(key=lambda x : (x[0], x[1]) )
        print(shifts)
        a = -1
        b = -1
        curr = 0

        for (k0, k1,k2) in shifts:
            arr1[k0] += (1 if k2 > 0 else -1)
            arr1[k1+1] += (-1 if k2 > 0 else 1)
            
            """
            if k2 == 0:
                for m in range(k0,k1+1):
                    arr1[m] -= 1
            else:
                for m in range(k0,k1+1):
                    arr1[m] += 1
            """
        pref = []
        temp = 0
        for a in arr1:
            temp += a
            pref.append(temp)


        def repl(idm, idx, curr):
            return arr[(idx + pref[idm]) % 26]
        curr = 0
        for idm, k in enumerate(s):
            idx = ord(k) - ord('a')
            s1.append(repl(idm, idx, curr))
        return "".join(s1)
            

        
            {% endraw %}
            