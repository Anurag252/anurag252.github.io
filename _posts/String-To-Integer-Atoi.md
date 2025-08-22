---
title: "String To Integer Atoi"
date: "2024-08-22T12:01:36+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 41 ms (37.68%) | Memory: 16.6 MB (19.92%) - LeetSync"
---

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






```