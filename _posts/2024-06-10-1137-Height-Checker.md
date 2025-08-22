---
            title: "1137 Height Checker"
            date: "2024-06-10T23:53:53+02:00"
            categories: ["leetcode"]
            tags: [c]
            layout: post
---
            
## [Height Checker](https://leetcode.com/problems/height-checker) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

A school is trying to take an annual photo of all the students. The students are asked to stand in a single file line in **non-decreasing order** by height. Let this ordering be represented by the integer array expected where expected[i] is the expected height of the ith student in line.

You are given an integer array heights representing the **current order** that the students are standing in. Each heights[i] is the height of the ith student in line (**0-indexed**).

Return *the **number of indices** where *heights[i] != expected[i].

 

Example 1:

```

**Input:** heights = [1,1,4,2,1,3]
**Output:** 3
**Explanation:** 
heights:  [1,1,4,2,1,3]
expected: [1,1,1,2,3,4]
Indices 2, 4, and 5 do not match.

```

Example 2:

```

**Input:** heights = [5,1,2,3,4]
**Output:** 5
**Explanation:**
heights:  [5,1,2,3,4]
expected: [1,2,3,4,5]
All indices do not match.

```

Example 3:

```

**Input:** heights = [1,2,3,4,5]
**Output:** 0
**Explanation:**
heights:  [1,2,3,4,5]
expected: [1,2,3,4,5]
All indices match.

```

 

**Constraints:**

	1 <= heights.length <= 100
	1 <= heights[i] <= 100

{% raw %}


````c



int comp (const void * elem1, const void * elem2) ;
int heightChecker(int* heights, int heightsSize) {
    int new_height[heightsSize];// = malloc(heightsSize*sizeof(int));
    for (int i = 0 ; i < heightsSize; i ++){
        new_height[i] = heights[i];
    }
   
    qsort (new_height, sizeof(new_height)/sizeof(*new_height), sizeof(*new_height), comp);

    int result = 0;

    for (int i = 0 ; i < heightsSize; i ++){
        printf("%d %d\n", new_height[i], heights[i]);
        if (new_height[i] != heights[i]) {
            result = result + 1;
        }
    }
    return result;

}

int comp (const void * elem1, const void * elem2) 
{
    int f = *((int*)elem1);
    int s = *((int*)elem2);
    if (f > s) return  1;
    if (f < s) return -1;
    return 0;
}


{% endraw %}
