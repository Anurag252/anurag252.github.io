---
            title: "371 Sum Of Two Integers"
            date: "2024-05-21T22:37:51+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
            ---
            

            ## [Sum of Two Integers](https://leetcode.com/problems/sum-of-two-integers) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given two integers a and b, return *the sum of the two integers without using the operators* + *and* -.

 

Example 1:

```
**Input:** a = 1, b = 2
**Output:** 3

```

Example 2:

```
**Input:** a = 2, b = 3
**Output:** 5

```

 

**Constraints:**

	-1000 <= a, b <= 1000

            {% raw %}
            ```python
            class Solution:
    def getSum(self, a: int, b: int) -> int:
        if a < 0 or b < 0:
            return a + b
        c = 0
        result = 0
        times = 0

        while (a > 0 or b > 0) :
            times = times + 1
            t1 = a & 1
            t2 = b & 1
            a = a >> 1
            b = b >> 1
            (t, c) = self.calculate_bitsum(t1, t2, c)
            print(t,c,"ASD")
            result = result << 1
            result = result | t
        if c == 1:
            times = times+1
            result = result << 1
            result = result | c
        result = self.inverse(result, times)
        return result

    def invert(self, a :int, count : int) -> int:
        t = pow(2,12) - 1
        res = a & t
        return ~ res

    def inverse(self, result: int, times : int) -> int :
        new_result = 0
        while times > 0 :
            times = times - 1
            print(result, "A")
            new_result = new_result << 1
            t = result & 1
            new_result = new_result | t
            result = result >> 1
            print(new_result)
        return new_result


    def calculate_bitsum(self, a :int, b : int, c_in :int) -> (int, int):
        sum_bit = (a ^ b) ^ c_in

        # Calculate carry bit
        carry_bit = ((a & b) | (a & c_in) | (b & c_in))

        return sum_bit, carry_bit
            {% endraw %}
            