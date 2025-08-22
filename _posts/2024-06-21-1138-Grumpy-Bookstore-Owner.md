---
            title: "1138 Grumpy Bookstore Owner"
            date: "2024-06-21T10:27:40+02:00"
            categories: ["leetcode"]
            tags: [c]
            layout: post
---
            
## [Grumpy Bookstore Owner](https://leetcode.com/problems/grumpy-bookstore-owner) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

There is a bookstore owner that has a store open for n minutes. Every minute, some number of customers enter the store. You are given an integer array customers of length n where customers[i] is the number of the customer that enters the store at the start of the ith minute and all those customers leave after the end of that minute.

On some minutes, the bookstore owner is grumpy. You are given a binary array grumpy where grumpy[i] is 1 if the bookstore owner is grumpy during the ith minute, and is 0 otherwise.

When the bookstore owner is grumpy, the customers of that minute are not satisfied, otherwise, they are satisfied.

The bookstore owner knows a secret technique to keep themselves not grumpy for minutes consecutive minutes, but can only use it once.

Return *the maximum number of customers that can be satisfied throughout the day*.

 

Example 1:

```

**Input:** customers = [1,0,1,2,1,1,7,5], grumpy = [0,1,0,1,0,1,0,1], minutes = 3
**Output:** 16
**Explanation:** The bookstore owner keeps themselves not grumpy for the last 3 minutes. 
The maximum number of customers that can be satisfied = 1 + 1 + 1 + 1 + 7 + 5 = 16.

```

Example 2:

```

**Input:** customers = [1], grumpy = [0], minutes = 1
**Output:** 1

```

 

**Constraints:**

	n == customers.length == grumpy.length
	1 <= minutes <= n <= 2 * 104
	0 <= customers[i] <= 1000
	grumpy[i] is either 0 or 1.

{% raw %}
```c
int maxSatisfied(int* customers, int customersSize, int* grumpy, int grumpySize, int minutes) {
    if (customersSize == 0) {
        return 0;
    }

    // Initialize prefix and suffix sums
    int prefix_sum[customersSize];
    int suffix_sum[customersSize];

    // Calculate prefix sum
    prefix_sum[0] = grumpy[0] == 0 ? customers[0] : 0;
    for (int i = 1; i < customersSize; i++) {
        prefix_sum[i] = prefix_sum[i - 1] + (grumpy[i] == 0 ? customers[i] : 0);
    }

    // Calculate suffix sum
    suffix_sum[customersSize - 1] = grumpy[customersSize - 1] == 0 ? customers[customersSize - 1] : 0;
    for (int i = customersSize - 2; i >= 0; i--) {
        suffix_sum[i] = suffix_sum[i + 1] + (grumpy[i] == 0 ? customers[i] : 0);
    }

    // Calculate the maximum additional satisfaction using the sliding window technique
    int maxAdditionalSatisfied = 0;
    for (int i = 0; i <= customersSize - minutes; i++) {
        int sum = 0;
        for (int j = i; j < i + minutes; j++) {
            sum += customers[j];
        }

        // Calculate the current satisfaction including the window
        int currentSatisfaction = (i > 0 ? prefix_sum[i - 1] : 0) + sum + (i + minutes < customersSize ? suffix_sum[i + minutes] : 0);
        if (currentSatisfaction > maxAdditionalSatisfied) {
            maxAdditionalSatisfied = currentSatisfaction;
        }
    }

    return maxAdditionalSatisfied;
}

{% endraw %}
