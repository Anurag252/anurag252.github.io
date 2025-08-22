---
            title: "40 Combination Sum Ii"
            date: "2024-08-13T09:30:02+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Combination Sum II](https://leetcode.com/problems/combination-sum-ii) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given a collection of candidate numbers (candidates) and a target number (target), find all unique combinations in candidates where the candidate numbers sum to target.

Each number in candidates may only be used **once** in the combination.

**Note:** The solution set must not contain duplicate combinations.

 

Example 1:

```

**Input:** candidates = [10,1,2,7,6,1,5], target = 8
**Output:** 
[
[1,1,6],
[1,2,5],
[1,7],
[2,6]
]

```

Example 2:

```

**Input:** candidates = [2,5,2,1,2], target = 5
**Output:** 
[
[1,2,2],
[5]
]

```

 

**Constraints:**

	1 <= candidates.length <= 100
	1 <= candidates[i] <= 50
	1 <= target <= 30

{% raw %}
```python
class Solution:
    def combinationSum2(self, candidates: List[int], target: int) -> List[List[int]]:
        visited = [0] * len(candidates)
        result = []
        candidates.sort()
        
        def Traverse(visited, start, target):
            if target < 0:
                return 
            if target == 0:
                res = [] 
                for k in range(len(visited)):
                    if visited[k] == 1:
                        res.append(candidates[k])
                result.append(res)
                return
            
            for k in range(start, len(candidates)):
                if k > start and candidates[k] == candidates[k - 1]:
                    continue
                if target - candidates[k] < 0:
                    break
                visited[k] = 1
                Traverse(visited, k + 1, target - candidates[k])
                visited[k] = 0

        Traverse(visited, 0, target)
        return result
{% endraw %}
