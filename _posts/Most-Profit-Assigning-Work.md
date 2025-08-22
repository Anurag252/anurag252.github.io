---
title: "Most Profit Assigning Work"
date: "2024-06-18T20:24:11+02:00"
categories: ["leetcode"]
tags: [c]
layout: post
problem_statement: "Time: 87 ms (14.29%) | Memory: 9 MB (57.14%) - LeetSync"
---

```c

struct CombinedValues {
    int diff;
    int profit;
};
int cmpfunc (const void * a, const void * b) {
   return ( (((struct CombinedValues*)a) -> diff) - (((struct CombinedValues*)b) -> diff) ); 
}

int find_max(struct CombinedValues *combined, int size, int worker) {
    int left = 0;
    int right = size - 1;
    int temp = 0;
    while (left <= right) {
        temp = left + (right - left) / 2;

        if (combined[temp].diff <= worker) {
            left = temp + 1;
        } else {
            right = temp - 1;
        }
    }

    if (combined[temp].diff <= worker) {
        return combined[temp].profit;
    } else {
        return combined[temp - 1].profit;
    }
}



int maxProfitAssignment(int* difficulty, int difficultySize, int* profit, int profitSize, int* worker, int workerSize) {
    
    struct CombinedValues* combined = malloc(difficultySize * sizeof(struct CombinedValues*));
    for ( int i = 0 ; i < difficultySize ; i ++) {
        combined[i].diff = difficulty[i];
        combined[i].profit = profit[i];
    }
    qsort(combined, difficultySize, sizeof(struct CombinedValues*), cmpfunc);

    int max_till_here = 0;
    for (int i = 0 ; i < difficultySize ; i ++) {
        
        if (max_till_here < combined[i].profit) {
            max_till_here = combined[i].profit;
        } else {
            combined[i].profit = max_till_here;
        }
        printf("%d %d\n", combined[i].profit, combined[i].diff);
    }

    int profi = 0 ;
    for (int i = 0 ; i < workerSize ; i ++) {
        if (worker[i] < combined[0].diff) {
            profi += 0;
        } else {
            profi = profi + find_max(combined,difficultySize,  worker[i]);
        }
        
    }
    return profi;
}

 
```