---
            title: "1217 Relative Sort Array"
            date: "2024-06-11T08:57:33+02:00"
            categories: ["leetcode"]
            tags: [c]
            layout: post
            ---
            

            ## [Relative Sort Array](https://leetcode.com/problems/relative-sort-array) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

Given two arrays arr1 and arr2, the elements of arr2 are distinct, and all elements in arr2 are also in arr1.

Sort the elements of arr1 such that the relative ordering of items in arr1 are the same as in arr2. Elements that do not appear in arr2 should be placed at the end of arr1 in **ascending** order.

 

Example 1:

```

**Input:** arr1 = [2,3,1,3,2,4,6,7,9,2,19], arr2 = [2,1,4,3,9,6]
**Output:** [2,2,2,1,4,3,3,9,6,7,19]

```

Example 2:

```

**Input:** arr1 = [28,6,22,8,44,17], arr2 = [22,28,8,6]
**Output:** [22,28,8,6,17,44]

```

 

**Constraints:**

	1 <= arr1.length, arr2.length <= 1000
	0 <= arr1[i], arr2[i] <= 1000
	All the elements of arr2 are **distinct**.
	Each arr2[i] is in arr1.

            {% raw %}
            ```c
            /**
 * Note: The returned array must be malloced, assume caller calls free().
 */

int compar (const void* p1, const void* p2);
int  *secondarr ;
int  secondarrSize ;


int* relativeSortArray(int* arr1, int arr1Size, int* arr2, int arr2Size, int* returnSize) {
    secondarr = malloc(arr2Size * sizeof(int*));
    secondarrSize = arr2Size;
    for (int i = 0 ; i < arr2Size; i ++){
        secondarr[i] = arr2[i];
    }
    int* new_arr = malloc(arr1Size * sizeof(int));
    for (int i = 0 ; i < arr1Size; i ++){
        new_arr[i] = arr1[i];
        printf("%d  %d\n", new_arr[i], i);
    }

    qsort(new_arr, arr1Size , sizeof(int), compar);
    for (int i = 0 ; i < arr1Size; i ++){
        printf("%d A %d\n", new_arr[i], i);
    }
    free(secondarr);
     *returnSize = arr1Size;
    return new_arr ;
}

int compar (const void* p1, const void* p2) {

    // find p1
    int i = 10000;
    int j = 10000;
    int* a = ((int*)p1);
    int* b = ((int*)p2);
    //printf("%d  %d", *a, *b);
    for (int k = 0 ; k < secondarrSize; k ++) {
        //printf("%d AB\n", secondarr[k]);
        if ((*a) == secondarr[k]) {
            i = k;
        }

        if ((*b) == secondarr[k]) {
            j = k;
        }
    }
    //printf("\n%d A %d\n", i, j);
    if (i == 10000 && j == 10000) {
        if (*a > *b){
            return 1;
        } else {
            return -1;
        }
    }

    if (i == 10000) {
        return 1;
    }

    if (j == 10000) {
        return -1;
    }

    if (i > j) {
        return 1;
    }

    if (i < j) {
        return -1;
    }
    return 0;
}

            {% endraw %}
            