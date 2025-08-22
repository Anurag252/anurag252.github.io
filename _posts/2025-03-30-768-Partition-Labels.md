---
            title: "768 Partition Labels"
            date: "2025-03-30T10:38:12+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Partition Labels](https://leetcode.com/problems/partition-labels) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a string s. We want to partition the string into as many parts as possible so that each letter appears in at most one part. For example, the string "ababcc" can be partitioned into ["abab", "cc"], but partitions such as ["aba", "bcc"] or ["ab", "ab", "cc"] are invalid.

Note that the partition is done so that after concatenating all the parts in order, the resultant string should be s.

Return *a list of integers representing the size of these parts*.

 

Example 1:

```

**Input:** s = "ababcbacadefegdehijhklij"
**Output:** [9,7,8]
**Explanation:**
The partition is "ababcbaca", "defegde", "hijhklij".
This is a partition so that each letter appears in at most one part.
A partition like "ababcbacadefegde", "hijhklij" is incorrect, because it splits s into less parts.

```

Example 2:

```

**Input:** s = "eccbbbbdec"
**Output:** [10]

```

 

**Constraints:**

	1 <= s.length <= 500
	s consists of lowercase English letters.

{% raw %}
```python
class Solution:
    def partitionLabels(self, s: str) -> List[int]:
        # create a map of char and last index
        # take a start elem
        # loop till start < end , end = max(cend, mp[char])
        # when start == end , add end - start + 1 to arr and then start = end + 1
        # do this till start < len(s)

        mp = {}

        for id, k in enumerate(s):
            mp[k] = id

        start = 0
        end = 0
        curr = 0
        res = []
        while(start <= end) :
            if curr == len(s):
                return res 
            end = max(end, mp[s[curr]])
            if curr == end:
                res.append(end - start + 1)
                start = end + 1
                curr = end
                end += 1
            curr += 1
        return res
            


        
{% endraw %}
