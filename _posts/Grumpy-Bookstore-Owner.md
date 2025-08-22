---
title: "Grumpy Bookstore Owner"
date: "2024-06-21T10:27:40+02:00"
categories: ["leetcode"]
tags: [c]
layout: post
problem_statement: "Time: 262 ms (31.25%) | Memory: 7.3 MB (81.25%) - LeetSync"
---

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

```