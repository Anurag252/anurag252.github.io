---
            title: "2107 Find Unique Binary String"
            date: "2026-03-08T21:13:21+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Find Unique Binary String](https://leetcode.com/problems/find-unique-binary-string) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given an array of strings nums containing n **unique** binary strings each of length n, return *a binary string of length *n* that **does not appear** in *nums*. If there are multiple answers, you may return **any** of them*.

 

Example 1:

```

**Input:** nums = ["01","10"]
**Output:** "11"
**Explanation:** "11" does not appear in nums. "00" would also be correct.

```

Example 2:

```

**Input:** nums = ["00","01"]
**Output:** "11"
**Explanation:** "11" does not appear in nums. "10" would also be correct.

```

Example 3:

```

**Input:** nums = ["111","011","001"]
**Output:** "101"
**Explanation:** "101" does not appear in nums. "000", "010", "100", and "110" would also be correct.

```

 

**Constraints:**

	n == nums.length
	1 <= n <= 16
	nums[i].length == n
	nums[i] is either '0' or '1'.
	All the strings of nums are **unique**.

{% raw %}


```python


class Solution:
    def findDifferentBinaryString(self, nums: List[str]) -> str:
        arr = []
        s = set()
        v = 0
        for k in nums:
            arr.append(int(k, 2))
            s.add(int(k, 2))
        #print(arr)
        for k in range(0, pow(2,len(nums[0]))):
            if k not in s:
                v = k
                break
        x = format(v, 'b')
        #print(x)
        if len(nums[0]) > len(str(x)):
            return ("0" * (len(nums[0]) - len(str(x)))) + str(x)
        return str(x)
        





{% endraw %}
```
