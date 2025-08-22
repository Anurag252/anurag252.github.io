---
            title: "2533 Bitwise Xor Of All Pairings"
            date: "2025-01-16T07:21:12+01:00"
            categories: ["leetcode"]
            tags: [go]
            layout: post
---
            
## [Bitwise XOR of All Pairings](https://leetcode.com/problems/bitwise-xor-of-all-pairings) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given two **0-indexed** arrays, nums1 and nums2, consisting of non-negative integers. There exists another array, nums3, which contains the bitwise XOR of **all pairings** of integers between nums1 and nums2 (every integer in nums1 is paired with every integer in nums2 **exactly once**).

Return* the **bitwise XOR** of all integers in *nums3.

 

Example 1:

```

**Input:** nums1 = [2,1,3], nums2 = [10,2,5,0]
**Output:** 13
**Explanation:**
A possible nums3 array is [8,0,7,2,11,3,4,1,9,1,6,3].
The bitwise XOR of all these numbers is 13, so we return 13.

```

Example 2:

```

**Input:** nums1 = [1,2], nums2 = [3,4]
**Output:** 0
**Explanation:**
All possible pairs of bitwise XORs are nums1[0] ^ nums2[0], nums1[0] ^ nums2[1], nums1[1] ^ nums2[0],
and nums1[1] ^ nums2[1].
Thus, one possible nums3 array is [2,5,1,6].
2 ^ 5 ^ 1 ^ 6 = 0, so we return 0.

```

 

**Constraints:**

	1 <= nums1.length, nums2.length <= 105
	0 <= nums1[i], nums2[j] <= 109

{% raw %}


````go


func xorAllNums(nums1 []int, nums2 []int) int {
    
    // if num2 is even times and num 1 is odd times then num2 is answer
    // num2 is even and num1 is even then ans is 0
    // if both are odd then do all xor ^ firste elem ^ ...
    if len(nums1) % 2 == 0 && len(nums2) % 2 == 0 {
        return 0
    }

    

    temp2 := nums2[0]
    for i := 1; i < len(nums2) ; i ++ {
        temp2 ^= nums2[i]
    }

   

    temp1 := nums1[0]

    for i := 1 ; i < len(nums1) ; i ++ {
        temp1 ^= nums1[i]
    }
     if len(nums1) % 2 == 0 && len(nums2) % 2 != 0 {
        return temp1
    }

     if len(nums1) % 2 != 0 && len(nums2) % 2 == 0 {
        return temp2
    }
    return temp1 ^ temp2
}


{% endraw %}
