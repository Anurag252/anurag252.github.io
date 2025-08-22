---
            title: "350 Intersection Of Two Arrays Ii"
            date: "2024-07-02T12:01:39+02:00"
            categories: ["leetcode"]
            tags: [c]
            layout: post
---
            
## [Intersection of Two Arrays II](https://leetcode.com/problems/intersection-of-two-arrays-ii) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

Given two integer arrays nums1 and nums2, return *an array of their intersection*. Each element in the result must appear as many times as it shows in both arrays and you may return the result in **any order**.

 

Example 1:

```

**Input:** nums1 = [1,2,2,1], nums2 = [2,2]
**Output:** [2,2]

```

Example 2:

```

**Input:** nums1 = [4,9,5], nums2 = [9,4,9,8,4]
**Output:** [4,9]
**Explanation:** [9,4] is also accepted.

```

 

**Constraints:**

	1 <= nums1.length, nums2.length <= 1000
	0 <= nums1[i], nums2[i] <= 1000

 

**Follow up:**

	What if the given array is already sorted? How would you optimize your algorithm?
	What if nums1's size is small compared to nums2's size? Which algorithm is better?
	What if elements of nums2 are stored on disk, and the memory is limited such that you cannot load all elements into the memory at once?

{% raw %}


````c


/**
 * Note: The returned array must be malloced, assume caller calls free().
 */

int compare(void* a, void * b) {
    int k1 = *((int*)(a));
    int k2 = *((int*)(b));
    return k1 - k2;
}

int* intersect(int* nums1, int nums1Size, int* nums2, int nums2Size, int* returnSize) {
    *returnSize = 0;
    if (nums1Size > nums2Size) {
        *returnSize = nums1Size;
    } else {
        *returnSize = nums2Size;
    }

    qsort(nums1, nums1Size, sizeof(int), compare);
    qsort(nums2, nums2Size, sizeof(int), compare);

    int* arr = malloc(*returnSize * sizeof(int));
    int a = 0;
    int b = 0;
    int c = 0;
    while(a < nums1Size && b < nums2Size){
        if (nums1[a] > nums2[b]){
            b ++ ;

        }else if (nums1[a] < nums2[b]){
            a ++ ;
            
        } else {
            arr[c] = nums1[a];
            c ++;
            a ++ ;
            b ++ ;
        }
    }
    *returnSize = c;
    return arr;
}


{% endraw %}
