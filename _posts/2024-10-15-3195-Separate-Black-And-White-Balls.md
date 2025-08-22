---
            title: "3195 Separate Black And White Balls"
            date: "2024-10-15T08:55:17+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Separate Black and White Balls](https://leetcode.com/problems/separate-black-and-white-balls) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

There are n balls on a table, each ball has a color black or white.

You are given a **0-indexed** binary string s of length n, where 1 and 0 represent black and white balls, respectively.

In each step, you can choose two adjacent balls and swap them.

Return *the **minimum** number of steps to group all the black balls to the right and all the white balls to the left*.

 

Example 1:

```

**Input:** s = "101"
**Output:** 1
**Explanation:** We can group all the black balls to the right in the following way:
- Swap s[0] and s[1], s = "011".
Initially, 1s are not grouped together, requiring at least 1 step to group them to the right.
```

Example 2:

```

**Input:** s = "100"
**Output:** 2
**Explanation:** We can group all the black balls to the right in the following way:
- Swap s[0] and s[1], s = "010".
- Swap s[1] and s[2], s = "001".
It can be proven that the minimum number of steps needed is 2.

```

Example 3:

```

**Input:** s = "0111"
**Output:** 0
**Explanation:** All the black balls are already grouped to the right.

```

 

**Constraints:**

	1 <= n == s.length <= 105
	s[i] is either '0' or '1'.

{% raw %}


````python


class Solution:
    def minimumSteps(self, s: str) -> int:

        arr = list(map(int, s))

        #print(arr)
        result = 0
        j = len(arr) - 1

        while(j >= 0 and arr[j] == 1):
                j -= 1
        # off by 1
        j += 1
        
        temp = j-1
        occ = 0
        count = 0
        while(temp >= 0):
            if arr[temp] == 1:
                result += (count - occ)
                occ += 1
            temp -= 1
            
            count += 1
        return result

        
        
#result += (pos - occ - 1)

        '''
        00000 101010 11111 011010
              101001
              100011

1 + 4-1-1 + 6-2-1

              101001
              100101
              100011
              010011
              001011
              000111

              000111
        101
        011
        10 -> 01
        01 
        110 -> 101, 011
        '''
        


{% endraw %}
