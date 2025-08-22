---
title: "./853 Most Profit Assigning Work"
date: "2024-06-18T20:24:11+02:00"
categories: ["leetcode"]
tags: [c]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/most-profit-assigning-work">Most Profit Assigning Work</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>You have <code>n</code> jobs and <code>m</code> workers. You are given three arrays: <code>difficulty</code>, <code>profit</code>, and <code>worker</code> where:</p>

<ul>
	<li><code>difficulty[i]</code> and <code>profit[i]</code> are the difficulty and the profit of the <code>i<sup>th</sup></code> job, and</li>
	<li><code>worker[j]</code> is the ability of <code>j<sup>th</sup></code> worker (i.e., the <code>j<sup>th</sup></code> worker can only complete a job with difficulty at most <code>worker[j]</code>).</li>
</ul>

<p>Every worker can be assigned <strong>at most one job</strong>, but one job can be <strong>completed multiple times</strong>.</p>

<ul>
	<li>For example, if three workers attempt the same job that pays <code>$1</code>, then the total profit will be <code>$3</code>. If a worker cannot complete any job, their profit is <code>$0</code>.</li>
</ul>

<p>Return the maximum profit we can achieve after assigning the workers to the jobs.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> difficulty = [2,4,6,8,10], profit = [10,20,30,40,50], worker = [4,5,6,7]
<strong>Output:</strong> 100
<strong>Explanation:</strong> Workers are assigned jobs of difficulty [4,4,6,6] and they get a profit of [20,20,30,30] separately.
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> difficulty = [85,47,57], profit = [24,66,99], worker = [40,25,25]
<strong>Output:</strong> 0
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>n == difficulty.length</code></li>
	<li><code>n == profit.length</code></li>
	<li><code>m == worker.length</code></li>
	<li><code>1 &lt;= n, m &lt;= 10<sup>4</sup></code></li>
	<li><code>1 &lt;= difficulty[i], profit[i], worker[i] &lt;= 10<sup>5</sup></code></li>
</ul>"
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