---
            title: "2202 Sum Of K Mirror Numbers"
            date: "2025-06-23T10:06:49+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Sum of k-Mirror Numbers](https://leetcode.com/problems/sum-of-k-mirror-numbers) ![image](https://img.shields.io/badge/Difficulty-Hard-red)

A **k-mirror number** is a **positive** integer **without leading zeros** that reads the same both forward and backward in base-10 **as well as** in base-k.

	For example, 9 is a 2-mirror number. The representation of 9 in base-10 and base-2 are 9 and 1001 respectively, which read the same both forward and backward.
	On the contrary, 4 is not a 2-mirror number. The representation of 4 in base-2 is 100, which does not read the same both forward and backward.

Given the base k and the number n, return *the **sum** of the* n ***smallest** k-mirror numbers*.

 

Example 1:

```

**Input:** k = 2, n = 5
**Output:** 25
Explanation:
The 5 smallest 2-mirror numbers and their representations in base-2 are listed as follows:
  base-10    base-2
    1          1
    3          11
    5          101
    7          111
    9          1001
Their sum = 1 + 3 + 5 + 7 + 9 = 25. 

```

Example 2:

```

**Input:** k = 3, n = 7
**Output:** 499
Explanation:
The 7 smallest 3-mirror numbers are and their representations in base-3 are listed as follows:
  base-10    base-3
    1          1
    2          2
    4          11
    8          22
    121        11111
    151        12121
    212        21212
Their sum = 1 + 2 + 4 + 8 + 121 + 151 + 212 = 499.

```

Example 3:

```

**Input:** k = 7, n = 17
**Output:** 20379000
**Explanation:** The 17 smallest 7-mirror numbers are:
1, 2, 3, 4, 5, 6, 8, 121, 171, 242, 292, 16561, 65656, 2137312, 4602064, 6597956, 6958596

```

 

**Constraints:**

	2 <= k <= 9
	1 <= n <= 30

{% raw %}


```python


class Solution:
    def kMirror(self, k: int, n: int) -> int:


        def generate_palindromes():
            # Yield palindromes in increasing order
            for length in range(1, 100):  # Adjust as needed
                half = 10 ** ((length - 1) // 2)
                for i in range(half, 10**((length + 1) // 2)):
                    s = str(i)
                    if length % 2 == 0:
                        yield int(s + s[::-1])
                    else:
                        yield int(s + s[-2::-1])
        def to_base_k(n, k):
            digits = []
            while n > 0:
                digits.append(str(n % k))
                n //= k
            return ''.join(reversed(digits)) or '0'

        
        
        found = 0
        final = 0
        total = 0
        while(True):
            for t in generate_palindromes():
                if to_base_k(t, k) == to_base_k(t, k)[::-1]:
                    total += t
                    found += 1
                    if found == n:
                        return total
            
        
                



        


{% endraw %}
