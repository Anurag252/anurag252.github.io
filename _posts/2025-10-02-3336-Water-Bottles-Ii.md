---
            title: "3336 Water Bottles Ii"
            date: "2025-10-02T07:36:20+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Water Bottles II](https://leetcode.com/problems/water-bottles-ii) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given two integers numBottles and numExchange.

numBottles represents the number of full water bottles that you initially have. In one operation, you can perform one of the following operations:

	Drink any number of full water bottles turning them into empty bottles.
	Exchange numExchange empty bottles with one full water bottle. Then, increase numExchange by one.

Note that you cannot exchange multiple batches of empty bottles for the same value of numExchange. For example, if numBottles == 3 and numExchange == 1, you cannot exchange 3 empty water bottles for 3 full bottles.

Return *the **maximum** number of water bottles you can drink*.

 

Example 1:

![image](https://assets.leetcode.com/uploads/2024/01/28/exampleone1.png)
```

**Input:** numBottles = 13, numExchange = 6
**Output:** 15
**Explanation:** The table above shows the number of full water bottles, empty water bottles, the value of numExchange, and the number of bottles drunk.

```

Example 2:

![image](https://assets.leetcode.com/uploads/2024/01/28/example231.png)
```

**Input:** numBottles = 10, numExchange = 3
**Output:** 13
**Explanation:** The table above shows the number of full water bottles, empty water bottles, the value of numExchange, and the number of bottles drunk.

```

 

**Constraints:**

	1 <= numBottles <= 100 
	1 <= numExchange <= 100

{% raw %}


```python


class Solution:
    def maxBottlesDrunk(self, numBottles: int, numExchange: int) -> int:
        full_bottles = numBottles
        res = full_bottles
        empty_bottles = full_bottles # drank all at once

        while(empty_bottles >= numExchange):
            #print(empty_bottles)
            #remaining = full_bottles - numExchange
            empty_bottles = empty_bottles - numExchange # exchnaged
            res += 1 # drank one that got
            empty_bottles += 1
            numExchange += 1
            #full_bottles += remaining
        return res




{% endraw %}
```
