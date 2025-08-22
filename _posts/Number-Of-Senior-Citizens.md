---
title: "Number Of Senior Citizens"
date: "2024-08-01T10:09:25+02:00"
categories: ["leetcode"]
tags: [c]
layout: post
problem_statement: "Time: 3 ms (79.00%) | Memory: 8.7 MB (34.00%) - LeetSync"
---

```c
int countSeniors(char ** details, int detailsSize){
    int result = 0;

    for (int i = 0 ; i < detailsSize ; i ++) {
        
        if ( (details[i][11] - '0') * 10 + (details[i][12] - '0') > 60) {
            result ++;
        }
    }
    return result;

}
```