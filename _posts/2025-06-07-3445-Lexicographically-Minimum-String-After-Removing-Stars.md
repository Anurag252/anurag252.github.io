---
            title: "3445 Lexicographically Minimum String After Removing Stars"
            date: "2025-06-07T22:22:04+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
            ---
            

            ## [Lexicographically Minimum String After Removing Stars](https://leetcode.com/problems/lexicographically-minimum-string-after-removing-stars) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a string s. It may contain any number of '*' characters. Your task is to remove all '*' characters.

While there is a '*', do the following operation:

	Delete the leftmost '*' and the **smallest** non-'*' character to its *left*. If there are several smallest characters, you can delete any of them.

Return the lexicographically smallest resulting string after removing all '*' characters.

 

Example 1:

**Input:** s = "aaba*"

**Output:** "aab"

**Explanation:**

We should delete one of the 'a' characters with '*'. If we choose s[3], s becomes the lexicographically smallest.

Example 2:

**Input:** s = "abc"

**Output:** "abc"

**Explanation:**

There is no '*' in the string.

 

**Constraints:**

	1 <= s.length <= 105
	s consists only of lowercase English letters and '*'.
	The input is generated such that it is possible to delete all '*' characters.

            {% raw %}
            ```python
            class Solution:
    def clearStars(self, s: str) -> str:
        arr = [0] * 26
        mp = {}
        st =[]
        for k in s:
            if k == "*":
                to_be_removed = ""
                for i, a in enumerate(arr):
                    if a > 0:
                        arr[i] -= 1
                        to_be_removed = chr(i + 97)
                        break
                
                index = mp[to_be_removed][-1]
                st[index] = "#"
                if len(mp[to_be_removed][:-1]) == 0:
                    del mp[to_be_removed]
                else:
                    mp[to_be_removed] = mp[to_be_removed][:-1]
                #print(st,mp, to_be_removed)
            else:
                st.append(k)
                if k in mp:
                    mp[k].append(len(st)-1)
                else:
                    mp[k] = [len(st)-1]
                #print(ord(k)-97)
                arr[ord(k)-97] += 1
        res = ""
        for k in st:
            if k != "#":
                res += k

        return res


        
            {% endraw %}
            