---
            title: "1834 Minimum Number Of People To Teach"
            date: "2025-09-10T21:45:24+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Minimum Number of People to Teach](https://leetcode.com/problems/minimum-number-of-people-to-teach) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

On a social network consisting of m users and some friendships between users, two users can communicate with each other if they know a common language.

You are given an integer n, an array languages, and an array friendships where:

	There are n languages numbered 1 through n,
	languages[i] is the set of languages the i​​​​​​th​​​​ user knows, and
	friendships[i] = [u​​​​​​i​​​, v​​​​​​i] denotes a friendship between the users u​​​​​​​​​​​i​​​​​ and vi.

You can choose **one** language and teach it to some users so that all friends can communicate with each other. Return the ***minimum** *number of users you need to teach.

Note that friendships are not transitive, meaning if x is a friend of y and y is a friend of z, this doesn't guarantee that x is a friend of z.

 

Example 1:

```

**Input:** n = 2, languages = [[1],[2],[1,2]], friendships = [[1,2],[1,3],[2,3]]
**Output:** 1
**Explanation:** You can either teach user 1 the second language or user 2 the first language.

```

Example 2:

```

**Input:** n = 3, languages = [[2],[1,3],[1,2],[3]], friendships = [[1,4],[1,2],[3,4],[2,3]]
**Output:** 2
**Explanation:** Teach the third language to users 1 and 3, yielding two users to teach.

```

 

**Constraints:**

	2 <= n <= 500
	languages.length == m
	1 <= m <= 500
	1 <= languages[i].length <= n
	1 <= languages[i][j] <= n
	1 <= u​​​​​​i < v​​​​​​i <= languages.length
	1 <= friendships.length <= 500
	All tuples (u​​​​​i, v​​​​​​i) are unique
	languages[i] contains only unique values

{% raw %}


```python


from typing import List

class Solution:
    def minimumTeachings(self, n: int, languages: List[List[int]], friendships: List[List[int]]) -> int:
        """
        Fix a candidate language, run DFS on the subgraph of 'bad friendships',
        and count how many people in that component need to learn the language.
        """

        def dfs(visited, root, mp, language, lang):
            if root in visited:
                return 0
            visited.add(root)

            res = 0
            if language not in lang[root]:
                res += 1  # teach this person

            for nei in mp.get(root, []):
                res += dfs(visited, nei, mp, language, lang)

            return res

        # convert languages to sets for easy membership checks
        lang = {i+1: set(l) for i, l in enumerate(languages)}

        # build graph of only "bad" friendships
        mp = {}
        for u, v in friendships:
            if lang[u].isdisjoint(lang[v]):  # only connect if no common language
                mp.setdefault(u, []).append(v)
                mp.setdefault(v, []).append(u)

        if not mp:   # everyone already communicates
            return 0

        ans = float("inf")
        for candidate in range(1, n+1):
            visited = set()
            res = 0
            for person in mp.keys():  # only bad-people matter
                res += dfs(visited, person, mp, candidate, lang)
            ans = min(ans, res)

        return ans



{% endraw %}
```
