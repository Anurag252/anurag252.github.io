---
title: "1720 Crawler Log Folder"
date: "2024-07-10T06:06:40+02:00"
categories: ["leetcode"]
tags: [c]
layout: post
problem_statement: |
  ## [Crawler Log Folder](https://leetcode.com/problems/crawler-log-folder) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)
  
  The Leetcode file system keeps a log each time some user performs a *change folder* operation.
  
  The operations are described below:
  
  	&quot;../&quot; : Move to the parent folder of the current folder. (If you are already in the main folder, **remain in the same folder**).
  	&quot;./&quot; : Remain in the same folder.
  	&quot;x/&quot; : Move to the child folder named x (This folder is **guaranteed to always exist**).
  
  You are given a list of strings logs where logs[i] is the operation performed by the user at the ith step.
  
  The file system starts in the main folder, then the operations in logs are performed.
  
  Return *the minimum number of operations needed to go back to the main folder after the change folder operations.*
  
  &nbsp;
  
  Example 1:
  
  ![image](https://assets.leetcode.com/uploads/2020/09/09/sample_11_1957.png)
  
  ```
  
  **Input:** logs = [\"d1/\",\"d2/\",\"../\",\"d21/\",\"./\"]
  **Output:** 2
  **Explanation: **Use this change folder operation \"../\" 2 times and go back to the main folder.
  
  ```
  
  Example 2:
  
  ![image](https://assets.leetcode.com/uploads/2020/09/09/sample_22_1957.png)
  
  ```
  
  **Input:** logs = [\"d1/\",\"d2/\",\"./\",\"d3/\",\"../\",\"d31/\"]
  **Output:** 3
  
  ```
  
  Example 3:
  
  ```
  
  **Input:** logs = [\"d1/\",\"../\",\"../\",\"../\"]
  **Output:** 0
  
  ```
  
  &nbsp;
  
  **Constraints:**
  
  	1 &lt;= logs.length &lt;= 103
  	2 &lt;= logs[i].length &lt;= 10
  	logs[i] contains lowercase English letters, digits, &#39;.&#39;, and &#39;/&#39;.
  	logs[i] follows the format described in the statement.
  	Folder names consist of lowercase English letters and digits.
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