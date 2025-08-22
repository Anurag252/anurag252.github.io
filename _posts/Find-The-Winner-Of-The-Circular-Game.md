---
title: "Find The Winner Of The Circular Game"
date: "2024-07-08T07:03:00+02:00"
categories: ["leetcode"]
tags: [c]
layout: post
problem_statement: "Time: 0 ms (100.00%) | Memory: 5.6 MB (46.91%) - LeetSync"
---

```c
int findTheWinner(int n, int k) {
    
    int ans = 0;
        for (int i = 2; i <= n; i++) {
            ans = (ans + k) % i;
        }
        // add 1 to convert back to 1 indexing
        return ans + 1;
    // operation runs n - 1 times
    // k % n , 2k % (n) , 3k % (n-1), nk % (n-k)
   //n - (1 + ... + n)k % n
}
```