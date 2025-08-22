---
title: "1516 The K Th Lexicographical String Of All Happy Strings Of Length N"
date: "2025-02-19T07:54:05+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: |
  ## [The k-th Lexicographical String of All Happy Strings of Length n](https://leetcode.com/problems/the-k-th-lexicographical-string-of-all-happy-strings-of-length-n) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)
  
  A **happy string** is a string that:
  
  	consists only of letters of the set [&#39;a&#39;, &#39;b&#39;, &#39;c&#39;].
  	s[i] != s[i + 1] for all values of i from 1 to s.length - 1 (string is 1-indexed).
  
  For example, strings **&quot;abc&quot;, &quot;ac&quot;, &quot;b&quot;** and **&quot;abcbabcbcb&quot;** are all happy strings and strings **&quot;aa&quot;, &quot;baa&quot;** and **&quot;ababbc&quot;** are not happy strings.
  
  Given two integers n and k, consider a list of all happy strings of length n sorted in lexicographical order.
  
  Return *the kth string* of this list or return an **empty string** if there are less than k happy strings of length n.
  
  &nbsp;
  
  Example 1:
  
  ```
  
  **Input:** n = 1, k = 3
  **Output:** \"c\"
  **Explanation:** The list [\"a\", \"b\", \"c\"] contains all happy strings of length 1. The third string is \"c\".
  
  ```
  
  Example 2:
  
  ```
  
  **Input:** n = 1, k = 4
  **Output:** \"\"
  **Explanation:** There are only 3 happy strings of length 1.
  
  ```
  
  Example 3:
  
  ```
  
  **Input:** n = 3, k = 9
  **Output:** \"cab\"
  **Explanation:** There are 12 different happy string of length 3 [\"aba\", \"abc\", \"aca\", \"acb\", \"bab\", \"bac\", \"bca\", \"bcb\", \"cab\", \"cac\", \"cba\", \"cbc\"]. You will find the 9th string = \"cab\"
  
  ```
  
  &nbsp;
  
  **Constraints:**
  
  	1 &lt;= n &lt;= 10
  	1 &lt;= k &lt;= 100
---

```go
//import "sort"
func getHappyString(n int, k int) string {
    str := []string{"a", "b", "c"}
    // list of n is a appended to n-1 list with restrictions
    res := calc(str, n) //T[n] = 2n*T[n-1] or  4n*T[n-2] or 8n*T[n-3] ..., T[n-1] = 2*T[n-2] -> n2^n
    // 2^10 is 1024
    //sort.Strings(res) // klogk -> saw from discussion that sorting maybe skipped as well as backtracking builds strings in correct order
    if len(res) > k - 1 {
        return res[k- 1]
    }
    return ""
}

func calc(str []string, n int) []string {
    if n == 1 {
        return str
    }
    newRes := make([]string, 0)
    res := calc(str, n-1)
    for _, k := range res {
        for _, k1 := range str {
                if string(k[len(k)-1]) != k1 {
                newRes = append(newRes,k + k1)
            }
        }
        
    }
    return newRes
}
```