---
title: "Subarray Sums Divisible By K"
date: "2024-06-12T16:45:42+02:00"
categories: ["leetcode"]
tags: [c]
layout: post
problem_statement: "Time: 33 ms (36.01%) | Memory: 7.6 MB (90.16%) - LeetSync"
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