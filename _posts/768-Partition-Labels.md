---
title: "768 Partition Labels"
date: "2025-03-30T10:38:12+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Partition Labels](https://leetcode.com/problems/partition-labels) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)
  
  You are given a string s. We want to partition the string into as many parts as possible so that each letter appears in at most one part. For example, the string &quot;ababcc&quot; can be partitioned into [&quot;abab&quot;, &quot;cc&quot;], but partitions such as [&quot;aba&quot;, &quot;bcc&quot;] or [&quot;ab&quot;, &quot;ab&quot;, &quot;cc&quot;] are invalid.
  
  Note that the partition is done so that after concatenating all the parts in order, the resultant string should be s.
  
  Return *a list of integers representing the size of these parts*.
  
  &nbsp;
  
  Example 1:
  
  ```
  
  **Input:** s = \"ababcbacadefegdehijhklij\"
  **Output:** [9,7,8]
  **Explanation:**
  The partition is \"ababcbaca\", \"defegde\", \"hijhklij\".
  This is a partition so that each letter appears in at most one part.
  A partition like \"ababcbacadefegde\", \"hijhklij\" is incorrect, because it splits s into less parts.
  
  ```
  
  Example 2:
  
  ```
  
  **Input:** s = \"eccbbbbdec\"
  **Output:** [10]
  
  ```
  
  &nbsp;
  
  **Constraints:**
  
  	1 &lt;= s.length &lt;= 500
  	s consists of lowercase English letters.
---

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
            


        
```