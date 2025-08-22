---
title: "./1138 Grumpy Bookstore Owner"
date: "2024-06-21T10:27:40+02:00"
categories: ["leetcode"]
tags: [c]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/grumpy-bookstore-owner">Grumpy Bookstore Owner</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>There is a bookstore owner that has a store open for <code>n</code> minutes. Every minute, some number of customers enter the store. You are given an integer array <code>customers</code> of length <code>n</code> where <code>customers[i]</code> is the number of the customer that enters the store at the start of the <code>i<sup>th</sup></code> minute and all those customers leave after the end of that minute.</p>

<p>On some minutes, the bookstore owner is grumpy. You are given a binary array grumpy where <code>grumpy[i]</code> is <code>1</code> if the bookstore owner is grumpy during the <code>i<sup>th</sup></code> minute, and is <code>0</code> otherwise.</p>

<p>When the bookstore owner is grumpy, the customers of that minute are not satisfied, otherwise, they are satisfied.</p>

<p>The bookstore owner knows a secret technique to keep themselves not grumpy for <code>minutes</code> consecutive minutes, but can only use it once.</p>

<p>Return <em>the maximum number of customers that can be satisfied throughout the day</em>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> customers = [1,0,1,2,1,1,7,5], grumpy = [0,1,0,1,0,1,0,1], minutes = 3
<strong>Output:</strong> 16
<strong>Explanation:</strong> The bookstore owner keeps themselves not grumpy for the last 3 minutes. 
The maximum number of customers that can be satisfied = 1 + 1 + 1 + 1 + 7 + 5 = 16.
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> customers = [1], grumpy = [0], minutes = 1
<strong>Output:</strong> 1
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>n == customers.length == grumpy.length</code></li>
	<li><code>1 &lt;= minutes &lt;= n &lt;= 2 * 10<sup>4</sup></code></li>
	<li><code>0 &lt;= customers[i] &lt;= 1000</code></li>
	<li><code>grumpy[i]</code> is either <code>0</code> or <code>1</code>.</li>
</ul>"
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