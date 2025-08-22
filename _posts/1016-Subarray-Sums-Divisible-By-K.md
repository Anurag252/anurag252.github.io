---
title: "./1016 Subarray Sums Divisible By K"
date: "2024-06-12T16:45:42+02:00"
categories: ["leetcode"]
tags: [c]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/subarray-sums-divisible-by-k">Subarray Sums Divisible by K</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>Given an integer array <code>nums</code> and an integer <code>k</code>, return <em>the number of non-empty <strong>subarrays</strong> that have a sum divisible by </em><code>k</code>.</p>

<p>A <strong>subarray</strong> is a <strong>contiguous</strong> part of an array.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> nums = [4,5,0,-2,-3,1], k = 5
<strong>Output:</strong> 7
<strong>Explanation:</strong> There are 7 subarrays with a sum divisible by k = 5:
[4, 5, 0, -2, -3, 1], [5], [5, 0], [5, 0, -2, -3], [0], [0, -2, -3], [-2, -3]
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> nums = [5], k = 9
<strong>Output:</strong> 0
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= nums.length &lt;= 3 * 10<sup>4</sup></code></li>
	<li><code>-10<sup>4</sup> &lt;= nums[i] &lt;= 10<sup>4</sup></code></li>
	<li><code>2 &lt;= k &lt;= 10<sup>4</sup></code></li>
</ul>"
---

```c
int subarraysDivByK(int* nums, int numsSize, int k) {
    if (numsSize == 0) {
        return 0;
    }
    int count[k+1];

    for (int i = 0 ; i <= k ; i ++) {
        count[i] = 0;
    }
    count[0] = 1;
    
    int sum = 0;
    int result = 0;
    for (int i = 0 ; i < numsSize ; i ++) {
            sum += nums[i];
            
            // finding the remainder of the sum
            int sumMod = sum % k;
            
            // to handle the negative sumMod case, i.e nums[-1,2,9], k = 2
            // whenver sumMod is less than 0, then add k into it
            if(sumMod < 0){
                sumMod += k;
            } 
            
            // add the frequency of sumMod into count, if its not present into vector, then 0 will get added, otherwise the frequency of sumMod will get added            
            result += count[sumMod];
            
            // increase the frequency of sumMod into map by 1
            count[sumMod]++;
    }

    return result;

}


```