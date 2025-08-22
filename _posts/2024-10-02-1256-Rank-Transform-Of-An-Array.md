---
            title: "1256 Rank Transform Of An Array"
            date: "2024-10-02T06:04:15+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Rank Transform of an Array](https://leetcode.com/problems/rank-transform-of-an-array) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

Given an array of integers arr, replace each element with its rank.

The rank represents how large the element is. The rank has the following rules:

	Rank is an integer starting from 1.
	The larger the element, the larger the rank. If two elements are equal, their rank must be the same.
	Rank should be as small as possible.

 

Example 1:

```

**Input:** arr = [40,10,20,30]
**Output:** [4,1,2,3]
**Explanation**: 40 is the largest element. 10 is the smallest. 20 is the second smallest. 30 is the third smallest.
```

Example 2:

```

**Input:** arr = [100,100,100]
**Output:** [1,1,1]
**Explanation**: Same elements share the same rank.

```

Example 3:

```

**Input:** arr = [37,12,28,9,100,56,80,5,12]
**Output:** [5,3,4,2,8,6,7,1,3]

```

 

**Constraints:**

	0 <= arr.length <= 105
	-109 <= arr[i] <= 109

{% raw %}


```python


class Solution:
    def arrayRankTransform(self, arr: List[int]) -> List[int]:
        arr_cpy = arr.copy()
        arr.sort()
        #print(arr, arr_cpy)
        result = [0] * len(arr)
        dic = {}
        temp = 0

        for idx, k in enumerate(arr) :
            if idx > 0 and k == arr[idx-1]:
                continue
            else:
                temp +=1
                dic[k] = temp

        for idx, k in enumerate(arr_cpy) :
            result[idx] = dic[k]

        return result
            

            


        


{% endraw %}
```
