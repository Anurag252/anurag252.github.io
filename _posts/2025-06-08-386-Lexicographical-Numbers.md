---
            title: "386 Lexicographical Numbers"
            date: "2025-06-08T18:06:30+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Lexicographical Numbers](https://leetcode.com/problems/lexicographical-numbers) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given an integer n, return all the numbers in the range [1, n] sorted in lexicographical order.

You must write an algorithm that runs in O(n) time and uses O(1) extra space. 

 

Example 1:

```
**Input:** n = 13
**Output:** [1,10,11,12,13,2,3,4,5,6,7,8,9]

```

Example 2:

```
**Input:** n = 2
**Output:** [1,2]

```

 

**Constraints:**

	1 <= n <= 5 * 104

{% raw %}


```python


class Solution:
    def lexicalOrder(self, n: int) -> List[int]:

        def recurse(m):
            if m > n :
                return
            res = [m]
            for i in range(0,10):
                t = recurse(m * (10) + i)
                if t != None:
                    res += t
            return res
        a = []
        for m in range(1,10):   
            l = recurse(m)
            if l != None:
                a += l
        return a
        


{% endraw %}
```
