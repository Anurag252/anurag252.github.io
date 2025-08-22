---
            title: "3143 Longest Unequal Adjacent Groups Subsequence I"
            date: "2025-05-15T23:46:38+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Longest Unequal Adjacent Groups Subsequence I](https://leetcode.com/problems/longest-unequal-adjacent-groups-subsequence-i) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

You are given a string array words and a **binary** array groups both of length n.

A subsequence of words is **alternating** if for any two *consecutive* strings in the sequence, their corresponding elements at the *same* indices in groups are **different** (that is, there *cannot* be consecutive 0 or 1).

Your task is to select the **longest alternating** subsequence from words.

Return *the selected subsequence. If there are multiple answers, return **any** of them.*

**Note:** The elements in words are distinct.

 

Example 1:

<div class="example-block" style="
    border-color: var(--border-tertiary);
    border-left-width: 2px;
    color: var(--text-secondary);
    font-size: .875rem;
    margin-bottom: 1rem;
    margin-top: 1rem;
    overflow: visible;
    padding-left: 1rem;
">

**Input:** <span class="example-io" style="
    font-family: Menlo,sans-serif;
    font-size: 0.85rem;
">words = ["e","a","b"], groups = [0,0,1]

**Output:** <span class="example-io" style="
    font-family: Menlo,sans-serif;
    font-size: 0.85rem;
">["e","b"]

**Explanation:** A subsequence that can be selected is ["e","b"] because groups[0] != groups[2]. Another subsequence that can be selected is ["a","b"] because groups[1] != groups[2]. It can be demonstrated that the length of the longest subsequence of indices that satisfies the condition is 2.

Example 2:

<div class="example-block" style="
    border-color: var(--border-tertiary);
    border-left-width: 2px;
    color: var(--text-secondary);
    font-size: .875rem;
    margin-bottom: 1rem;
    margin-top: 1rem;
    overflow: visible;
    padding-left: 1rem;
">

**Input:** <span class="example-io" style="
    font-family: Menlo,sans-serif;
    font-size: 0.85rem;
">words = ["a","b","c","d"], groups = [1,0,1,1]

**Output:** <span class="example-io" style="
    font-family: Menlo,sans-serif;
    font-size: 0.85rem;
">["a","b","c"]

**Explanation:** A subsequence that can be selected is ["a","b","c"] because groups[0] != groups[1] and groups[1] != groups[2]. Another subsequence that can be selected is ["a","b","d"] because groups[0] != groups[1] and groups[1] != groups[3]. It can be shown that the length of the longest subsequence of indices that satisfies the condition is 3.

 

**Constraints:**

	1 <= n == words.length == groups.length <= 100
	1 <= words[i].length <= 10
	groups[i] is either 0 or 1.
	words consists of **distinct** strings.
	words[i] consists of lowercase English letters.

{% raw %}
```python
class Solution:
    def getLongestSubsequence(self, words: List[str], groups: List[int]) -> List[str]:
        """
        T[n] = max(T[n-i] + 1) if grp[n-i] != grp[n]

        """
        T = [1] * len(words)
        res = []
        if len(words) == 1:
            return [words[0]]

        for i, k1 in enumerate(words):
            for j , k2 in enumerate(words[:i]):
                if groups[i] != groups[j]:
                    if T[j] + 1 > T[i]:
                        T[i] = max(T[i], T[j] + 1)
        prev = 1
        res.append(words[0])
        for i, k in enumerate(T[1:]):
            if k == prev + 1:
                prev = k
                res.append(words[i+1])
        return res



        


        
{% endraw %}
