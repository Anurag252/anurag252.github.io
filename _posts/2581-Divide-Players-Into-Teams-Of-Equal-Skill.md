---
title: "./2581 Divide Players Into Teams Of Equal Skill"
date: "2024-10-04T21:11:40+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/divide-players-into-teams-of-equal-skill">Divide Players Into Teams of Equal Skill</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>You are given a positive integer array <code>skill</code> of <strong>even</strong> length <code>n</code> where <code>skill[i]</code> denotes the skill of the <code>i<sup>th</sup></code> player. Divide the players into <code>n / 2</code> teams of size <code>2</code> such that the total skill of each team is <strong>equal</strong>.</p>

<p>The <strong>chemistry</strong> of a team is equal to the <strong>product</strong> of the skills of the players on that team.</p>

<p>Return <em>the sum of the <strong>chemistry</strong> of all the teams, or return </em><code>-1</code><em> if there is no way to divide the players into teams such that the total skill of each team is equal.</em></p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> skill = [3,2,5,1,3,4]
<strong>Output:</strong> 22
<strong>Explanation:</strong> 
Divide the players into the following teams: (1, 5), (2, 4), (3, 3), where each team has a total skill of 6.
The sum of the chemistry of all the teams is: 1 * 5 + 2 * 4 + 3 * 3 = 5 + 8 + 9 = 22.
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> skill = [3,4]
<strong>Output:</strong> 12
<strong>Explanation:</strong> 
The two players form a team with a total skill of 7.
The chemistry of the team is 3 * 4 = 12.
</pre>

<p><strong class="example">Example 3:</strong></p>

<pre>
<strong>Input:</strong> skill = [1,1,2,3]
<strong>Output:</strong> -1
<strong>Explanation:</strong> 
There is no way to divide the players into teams such that the total skill of each team is equal.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>2 &lt;= skill.length &lt;= 10<sup>5</sup></code></li>
	<li><code>skill.length</code> is even.</li>
	<li><code>1 &lt;= skill[i] &lt;= 1000</code></li>
</ul>"
---

```python
class Solution:
    def dividePlayers(self, skill: List[int]) -> int:
        s = sum(skill)
        each_sum = 2 * (s / len(skill))
        if each_sum  != int(each_sum) :
            return -1
        each_sum = int(each_sum)
        hash = {}

        for idx,k in enumerate(skill):
                if k in hash:
                    hash[k].append(idx)
                else:
                    hash[k] = [idx]
        result = 0
        print(hash, s, each_sum)
        for k,v in hash.items():
            if each_sum - k not in hash:
                return -1
            other_item = hash[each_sum - k]
            
            if each_sum - k == k:
                start = 0
                while(start < len(v)):
                    result += (skill[v[start]] * skill[v[start+1]])
                    start += 2
            else:
                if len(v) != len(other_item):
                    return -1
                for n1, n2 in zip(v, other_item):
                    result += (skill[n1]*skill[n2])
            hash[k] = []
            hash[each_sum - k] = []


        return result
        
```