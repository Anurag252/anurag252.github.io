---
            title: "1016 Subarray Sums Divisible By K"
            date: "2024-06-12T16:45:42+02:00"
            categories: ["leetcode"]
            tags: [c]
            layout: post
---
            
## [Subarray Sums Divisible by K](https://leetcode.com/problems/subarray-sums-divisible-by-k) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given an integer array nums and an integer k, return *the number of non-empty **subarrays** that have a sum divisible by *k.

A **subarray** is a **contiguous** part of an array.

 

Example 1:

```

**Input:** nums = [4,5,0,-2,-3,1], k = 5
**Output:** 7
**Explanation:** There are 7 subarrays with a sum divisible by k = 5:
[4, 5, 0, -2, -3, 1], [5], [5, 0], [5, 0, -2, -3], [0], [0, -2, -3], [-2, -3]

```

Example 2:

```

**Input:** nums = [5], k = 9
**Output:** 0

```

 

**Constraints:**

	1 <= nums.length <= 3 * 104
	-104 <= nums[i] <= 104
	2 <= k <= 104

{% raw %}


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




{% endraw %}
```
