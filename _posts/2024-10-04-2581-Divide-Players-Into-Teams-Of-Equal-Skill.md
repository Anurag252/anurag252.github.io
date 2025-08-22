---
            title: "2581 Divide Players Into Teams Of Equal Skill"
            date: "2024-10-04T21:11:40+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Divide Players Into Teams of Equal Skill](https://leetcode.com/problems/divide-players-into-teams-of-equal-skill) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a positive integer array skill of **even** length n where skill[i] denotes the skill of the ith player. Divide the players into n / 2 teams of size 2 such that the total skill of each team is **equal**.

The **chemistry** of a team is equal to the **product** of the skills of the players on that team.

Return *the sum of the **chemistry** of all the teams, or return *-1* if there is no way to divide the players into teams such that the total skill of each team is equal.*

 

Example 1:

```

**Input:** skill = [3,2,5,1,3,4]
**Output:** 22
**Explanation:** 
Divide the players into the following teams: (1, 5), (2, 4), (3, 3), where each team has a total skill of 6.
The sum of the chemistry of all the teams is: 1 * 5 + 2 * 4 + 3 * 3 = 5 + 8 + 9 = 22.

```

Example 2:

```

**Input:** skill = [3,4]
**Output:** 12
**Explanation:** 
The two players form a team with a total skill of 7.
The chemistry of the team is 3 * 4 = 12.

```

Example 3:

```

**Input:** skill = [1,1,2,3]
**Output:** -1
**Explanation:** 
There is no way to divide the players into teams such that the total skill of each team is equal.

```

 

**Constraints:**

	2 <= skill.length <= 105
	skill.length is even.
	1 <= skill[i] <= 1000

{% raw %}


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
        


{% endraw %}
