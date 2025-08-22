---
title: "Remove Element"
date: "2024-04-29T22:57:20+02:00"
categories: ["leetcode"]
tags: [c]
layout: post
problem_statement: "Time: 3 ms (52.18%) | Memory: 5.6 MB (99.09%) - LeetSync"
---

```c
int removeElement(int* nums, int numsSize, int val) {

    int result = 0;
   
   

    for (int i = 0 ; i < numsSize ; i ++) {
        if ( *(nums + i) == val) {
            result ++;
            *(nums + i) = -1;
        }
    }
    int i = 0;
    while(i < numsSize  ) {
        if  ( *(nums + i) == -1) {
            int j = i;
            printf("k\n");
            while (j < numsSize && *(nums + j) == -1 ) {
                j ++ ;
            }
            if (j < numsSize) {
                 *(nums + i) = *(nums + j);
                 *(nums + j) = -1;

            }
           
            i ++ ;
        } else {
            i ++ ;
        }
    }

    printf("%d", result);
    return numsSize - result;


}
```