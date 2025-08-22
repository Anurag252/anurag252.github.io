---
            title: "264 Ugly Number Ii"
            date: "2024-08-18T10:49:48+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Ugly Number II](https://leetcode.com/problems/ugly-number-ii) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

An **ugly number** is a positive integer whose prime factors are limited to 2, 3, and 5.

Given an integer n, return *the* nth ***ugly number***.

 

Example 1:

```

**Input:** n = 10
**Output:** 12
**Explanation:** [1, 2, 3, 4, 5, 6, 8, 9, 10, 12] is the sequence of the first 10 ugly numbers.

```

Example 2:

```

**Input:** n = 1
**Output:** 1
**Explanation:** 1 has no prime factors, therefore all of its prime factors are limited to 2, 3, and 5.

```

 

**Constraints:**

	1 <= n <= 1690

{% raw %}


```python


class Solution:
    def nthUglyNumber(self, n: int) -> int:
        s = set()
        h = [1]
        temp =[1]
        while (len(h) <= 2*n):
            elem = heapq.heappop(temp)
            #print(elem)
            if elem*2 not in s:
                heapq.heappush(h, elem*2)
                heapq.heappush(temp, elem*2)
                s.add(elem*2)
            if elem*3 not in s:
                heapq.heappush(h, elem*3)
                heapq.heappush(temp, elem*3)
                s.add(elem*3)
            if elem*5 not in s:
                heapq.heappush(h, elem*5)
                heapq.heappush(temp, elem*5)
                s.add(elem*5)
        h.sort()
        #print(h)
        return h[n-1]


        
        # 2n, 2n + 2 (n > 1), 3n, 3n + 3 (n > 1), 5n, 5n + 5

        

        


{% endraw %}
