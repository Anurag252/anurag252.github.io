---
            title: "2691 Count Vowel Strings In Ranges"
            date: "2025-01-02T08:21:31+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Count Vowel Strings in Ranges](https://leetcode.com/problems/count-vowel-strings-in-ranges) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a **0-indexed** array of strings words and a 2D array of integers queries.

Each query queries[i] = [li, ri] asks us to find the number of strings present in the range li to ri (both **inclusive**) of words that start and end with a vowel.

Return *an array *ans* of size *queries.length*, where *ans[i]* is the answer to the *ith* query*.

**Note** that the vowel letters are 'a', 'e', 'i', 'o', and 'u'.

 

Example 1:

```

**Input:** words = ["aba","bcb","ece","aa","e"], queries = [[0,2],[1,4],[1,1]]
**Output:** [2,3,0]
**Explanation:** The strings starting and ending with a vowel are "aba", "ece", "aa" and "e".
The answer to the query [0,2] is 2 (strings "aba" and "ece").
to query [1,4] is 3 (strings "ece", "aa", "e").
to query [1,1] is 0.
We return [2,3,0].

```

Example 2:

```

**Input:** words = ["a","e","i"], queries = [[0,2],[0,1],[2,2]]
**Output:** [3,2,1]
**Explanation:** Every string satisfies the conditions, so we return [3,2,1].
```

 

**Constraints:**

	1 <= words.length <= 105
	1 <= words[i].length <= 40
	words[i] consists only of lowercase English letters.
	sum(words[i].length) <= 3 * 105
	1 <= queries.length <= 105
	0 <= li <= ri < words.length

{% raw %}


```python


class Solution:
    def vowelStrings(self, words: List[str], queries: List[List[int]]) -> List[int]:
        pref = []
        temp = 0
        for k in words:
            if (k[0] == "a" or k[0] == "e" or k[0] == "i" or k[0] == "o" or k[0] == "u" ) and \
                (k[-1] == "a" or k[-1] == "e" or k[-1] == "i" or k[-1] == "o" or k[-1] == "u"):
                temp += 1
            pref.append(temp)
        
        res = []
        for q in queries:
            if q[0] > 0:
                t = pref[q[1]] - pref[q[0]-1]
                res.append(t)
            else:
                t = pref[q[1]] - pref[q[0]] + 1 if pref[q[0]] == 1 else pref[q[1]]
                res.append(t)
        return res


{% endraw %}
