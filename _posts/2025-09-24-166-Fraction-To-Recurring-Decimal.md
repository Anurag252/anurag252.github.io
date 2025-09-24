---
            title: "166 Fraction To Recurring Decimal"
            date: "2025-09-24T21:56:46+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Fraction to Recurring Decimal](https://leetcode.com/problems/fraction-to-recurring-decimal) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given two integers representing the numerator and denominator of a fraction, return *the fraction in string format*.

If the fractional part is repeating, enclose the repeating part in parentheses.

If multiple answers are possible, return **any of them**.

It is **guaranteed** that the length of the answer string is less than 104 for all the given inputs.

 

Example 1:

```

**Input:** numerator = 1, denominator = 2
**Output:** "0.5"

```

Example 2:

```

**Input:** numerator = 2, denominator = 1
**Output:** "2"

```

Example 3:

```

**Input:** numerator = 4, denominator = 333
**Output:** "0.(012)"

```

 

**Constraints:**

	-231 <= numerator, denominator <= 231 - 1
	denominator != 0

{% raw %}


```python


class Solution:
    def fractionToDecimal(self, numerator: int, denominator: int) -> str:
        if numerator == 0:
            return "0"

        fraction = []
        if (numerator < 0) ^ (denominator < 0):
            fraction.append("-")

        dividend = abs(numerator)
        divisor = abs(denominator)
        fraction.append(str(dividend // divisor))
        remainder = dividend % divisor
        if remainder == 0:
            return "".join(fraction)

        fraction.append(".")
        map_dict = {}
        while remainder != 0:
            if remainder in map_dict:
                fraction.insert(map_dict[remainder], "(")
                fraction.append(")")
                break
            map_dict[remainder] = len(fraction)
            remainder *= 10
            fraction.append(str(remainder // divisor))
            remainder %= divisor

        return "".join(fraction)


{% endraw %}
```
