---
            title: "2095 Minimum Number Of Swaps To Make The String Balanced"
            date: "2024-10-08T08:49:36+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Minimum Number of Swaps to Make the String Balanced](https://leetcode.com/problems/minimum-number-of-swaps-to-make-the-string-balanced) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a **0-indexed** string s of **even** length n. The string consists of **exactly** n / 2 opening brackets '[' and n / 2 closing brackets ']'.

A string is called **balanced** if and only if:

	It is the empty string, or
	It can be written as AB, where both A and B are **balanced** strings, or
	It can be written as [C], where C is a **balanced** string.

You may swap the brackets at **any** two indices **any** number of times.

Return *the **minimum** number of swaps to make *s ***balanced***.

 

Example 1:

```

**Input:** s = "][]["
**Output:** 1
**Explanation:** You can make the string balanced by swapping index 0 with index 3.
The resulting string is "[[]]".

```

Example 2:

```

**Input:** s = "]]][[["
**Output:** 2
**Explanation:** You can do the following to make the string balanced:
- Swap index 0 with index 4. s = "[]][][".
- Swap index 1 with index 5. s = "[[][]]".
The resulting string is "[[][]]".

```

Example 3:

```

**Input:** s = "[]"
**Output:** 0
**Explanation:** The string is already balanced.

```

 

**Constraints:**

	n == s.length
	2 <= n <= 106
	n is even.
	s[i] is either '[' or ']'.
	The number of opening brackets '[' equals n / 2, and the number of closing brackets ']' equals n / 2.

{% raw %}
```python
class Solution:
    def minSwaps(self, s: str) -> int:
        imbalance = 0
        balance = 0
        
        for char in s:
            if char == '[':
                balance += 1
            else:  # char == ']'
                balance -= 1
            
            # If balance goes negative, we have more ] than [ so far
            if balance < 0:
                imbalance += 1
                balance = 0  # Reset balance to zero to continue counting fresh

        # Each swap fixes two misplacements
        return (imbalance + 1) // 2
        
  
#T[o,n] = T[1,n-1] + 1 if s[0], s[n] makes a bracket , else T[1,n-1] or inf
#T[0,n] = T[0,n-2] + 1   if s[n-1] + s[n] does not make a bracket else T[0, n-2] of inf

      
{% endraw %}
