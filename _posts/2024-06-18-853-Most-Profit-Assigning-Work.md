---
            title: "853 Most Profit Assigning Work"
            date: "2024-06-18T20:24:11+02:00"
            categories: ["leetcode"]
            tags: [c]
            layout: post
---
            
## [Most Profit Assigning Work](https://leetcode.com/problems/most-profit-assigning-work) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You have n jobs and m workers. You are given three arrays: difficulty, profit, and worker where:

	difficulty[i] and profit[i] are the difficulty and the profit of the ith job, and
	worker[j] is the ability of jth worker (i.e., the jth worker can only complete a job with difficulty at most worker[j]).

Every worker can be assigned **at most one job**, but one job can be **completed multiple times**.

	For example, if three workers attempt the same job that pays $1, then the total profit will be $3. If a worker cannot complete any job, their profit is $0.

Return the maximum profit we can achieve after assigning the workers to the jobs.

 

Example 1:

```

**Input:** difficulty = [2,4,6,8,10], profit = [10,20,30,40,50], worker = [4,5,6,7]
**Output:** 100
**Explanation:** Workers are assigned jobs of difficulty [4,4,6,6] and they get a profit of [20,20,30,30] separately.

```

Example 2:

```

**Input:** difficulty = [85,47,57], profit = [24,66,99], worker = [40,25,25]
**Output:** 0

```

 

**Constraints:**

	n == difficulty.length
	n == profit.length
	m == worker.length
	1 <= n, m <= 104
	1 <= difficulty[i], profit[i], worker[i] <= 105

{% raw %}


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

 


{% endraw %}
```
