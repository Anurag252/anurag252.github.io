---
            title: "8 String To Integer Atoi"
            date: "2024-08-22T12:01:36+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [String to Integer (atoi)](https://leetcode.com/problems/string-to-integer-atoi) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Implement the myAtoi(string s) function, which converts a string to a 32-bit signed integer.

The algorithm for myAtoi(string s) is as follows:

	**Whitespace**: Ignore any leading whitespace (" ").
	**Signedness**: Determine the sign by checking if the next character is '-' or '+', assuming positivity is neither present.
	**Conversion**: Read the integer by skipping leading zeros until a non-digit character is encountered or the end of the string is reached. If no digits were read, then the result is 0.
	**Rounding**: If the integer is out of the 32-bit signed integer range [-231, 231 - 1], then round the integer to remain in the range. Specifically, integers less than -231 should be rounded to -231, and integers greater than 231 - 1 should be rounded to 231 - 1.

Return the integer as the final result.

 

Example 1:

**Input:** s = "42"

**Output:** 42

**Explanation:**

```

The underlined characters are what is read in and the caret is the current reader position.
Step 1: "42" (no characters read because there is no leading whitespace)
         ^
Step 2: "42" (no characters read because there is neither a '-' nor '+')
         ^
Step 3: "42" ("42" is read in)
           ^

```

Example 2:

**Input:** s = " -042"

**Output:** -42

**Explanation:**

```

Step 1: "   -042" (leading whitespace is read and ignored)
            ^
Step 2: "   -042" ('-' is read, so the result should be negative)
             ^
Step 3: "   -042" ("042" is read in, leading zeros ignored in the result)
               ^

```

Example 3:

**Input:** s = "1337c0d3"

**Output:** 1337

**Explanation:**

```

Step 1: "1337c0d3" (no characters read because there is no leading whitespace)
         ^
Step 2: "1337c0d3" (no characters read because there is neither a '-' nor '+')
         ^
Step 3: "1337c0d3" ("1337" is read in; reading stops because the next character is a non-digit)
             ^

```

Example 4:

**Input:** s = "0-1"

**Output:** 0

**Explanation:**

```

Step 1: "0-1" (no characters read because there is no leading whitespace)
         ^
Step 2: "0-1" (no characters read because there is neither a '-' nor '+')
         ^
Step 3: "0-1" ("0" is read in; reading stops because the next character is a non-digit)
          ^

```

Example 5:

**Input:** s = "words and 987"

**Output:** 0

**Explanation:**

Reading stops at the first non-digit character 'w'.

 

**Constraints:**

	0 <= s.length <= 200
	s consists of English letters (lower-case and upper-case), digits (0-9), ' ', '+', '-', and '.'.

{% raw %}
```python
class Solution:
    def myAtoi(self, s: str) -> int:
        leading_whitespace_check = True
        check_sign = True
        is_nagative = False
        is_number = False
        allowed_char = [0,1,2,3,4,5,6,7,8,9,"-", " "]
        allowed_map = {"0":0,"1":1,"2":2,"3":3,"4":4,"5":5,"6":6,"7":7,"8":8,"9":9, " ":100,"+":100,"-":100}
        result = 0
        i = 1
        
        for k in s:
            if k not in allowed_map:
                break
            if k == "+":
                is_nagative = False
                del allowed_map["+"]
                del allowed_map["-"]
                del allowed_map[" "]
                continue
            
            if k == "-":
                is_nagative = True
                del allowed_map["-"]
                del allowed_map["+"]
                del allowed_map[" "]
                continue

            if k == " ":
                continue
            if allowed_map[k] < 100 :
                if " " in allowed_map:
                    del allowed_map[" "]
                if "+" in allowed_map:
                    del allowed_map["+"]
                if "-" in allowed_map:
                    del allowed_map["-"]
            
            result = result *  i + allowed_map[k]
            i = 10 if not(k == "0" and not is_number) else 1
            is_number = True
        result = result if not is_nagative else -1*result
        if result <= -2147483648:
            return -2147483648
        if result > 2147483647:
            return 2147483647
        return result






{% endraw %}
