---
title: "Crawler Log Folder"
date: "2024-07-10T06:06:40+02:00"
categories: ["leetcode"]
tags: [c]
layout: post
problem_statement: "Time: 4 ms (58.33%) | Memory: 6.5 MB (44.44%) - LeetSync"
---

```c
int minOperations(char** logs, int logsSize) {

    int level = 0;
    for (int i = 0 ; i < logsSize; i ++) {
        if (strcmp(logs[i] , "../" ) == 0) {
            level  = (level == 0 ? 0 : level - 1) ;
            continue;
        }

        if (strcmp(logs[i] , "./" ) == 0) {
            
            continue;
        }


        level ++ ;


    }
    return level ;
}
```