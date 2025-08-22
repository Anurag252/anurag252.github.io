---
title: "Water Bottles"
date: "2024-07-07T10:48:51+02:00"
categories: ["leetcode"]
tags: [c]
layout: post
problem_statement: "Time: 2 ms (64.86%) | Memory: 5.2 MB (77.03%) - LeetSync"
---

```c
int replace(int numBottles, int numExchange, int emptyBottle) {
    
    printf("%d %d %d\n", numBottles, numExchange ,emptyBottle);
    if (emptyBottle >= numExchange) {
        numBottles += emptyBottle / numExchange;
        emptyBottle = emptyBottle % numExchange;
    }

    if (numBottles  == 0) {
        return 0;
    }

    return numBottles +   replace(numBottles/numExchange  , numExchange, emptyBottle + (numBottles % numExchange) );
}

int numWaterBottles(int numBottles, int numExchange) {
    return replace(numBottles, numExchange, 0);
}
```