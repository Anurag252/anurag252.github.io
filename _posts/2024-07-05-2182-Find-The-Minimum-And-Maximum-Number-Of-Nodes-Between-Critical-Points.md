---
            title: "2182 Find The Minimum And Maximum Number Of Nodes Between Critical Points"
            date: "2024-07-05T08:56:49+02:00"
            categories: ["leetcode"]
            tags: [c]
            layout: post
            ---
            

            ## [Find the Minimum and Maximum Number of Nodes Between Critical Points](https://leetcode.com/problems/find-the-minimum-and-maximum-number-of-nodes-between-critical-points) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

A **critical point** in a linked list is defined as **either** a **local maxima** or a **local minima**.

A node is a **local maxima** if the current node has a value **strictly greater** than the previous node and the next node.

A node is a **local minima** if the current node has a value **strictly smaller** than the previous node and the next node.

Note that a node can only be a local maxima/minima if there exists **both** a previous node and a next node.

Given a linked list head, return *an array of length 2 containing *[minDistance, maxDistance]* where *minDistance* is the **minimum distance** between **any two distinct** critical points and *maxDistance* is the **maximum distance** between **any two distinct** critical points. If there are **fewer** than two critical points, return *[-1, -1].

 

Example 1:

![image](https://assets.leetcode.com/uploads/2021/10/13/a1.png)
```

**Input:** head = [3,1]
**Output:** [-1,-1]
**Explanation:** There are no critical points in [3,1].

```

Example 2:

![image](https://assets.leetcode.com/uploads/2021/10/13/a2.png)
```

**Input:** head = [5,3,1,2,5,1,2]
**Output:** [1,3]
**Explanation:** There are three critical points:
- [5,3,**1**,2,5,1,2]: The third node is a local minima because 1 is less than 3 and 2.
- [5,3,1,2,**5**,1,2]: The fifth node is a local maxima because 5 is greater than 2 and 1.
- [5,3,1,2,5,**1**,2]: The sixth node is a local minima because 1 is less than 5 and 2.
The minimum distance is between the fifth and the sixth node. minDistance = 6 - 5 = 1.
The maximum distance is between the third and the sixth node. maxDistance = 6 - 3 = 3.

```

Example 3:

![image](https://assets.leetcode.com/uploads/2021/10/14/a5.png)
```

**Input:** head = [1,3,2,2,3,2,2,2,7]
**Output:** [3,3]
**Explanation:** There are two critical points:
- [1,**3**,2,2,3,2,2,2,7]: The second node is a local maxima because 3 is greater than 1 and 2.
- [1,3,2,2,**3**,2,2,2,7]: The fifth node is a local maxima because 3 is greater than 2 and 2.
Both the minimum and maximum distances are between the second and the fifth node.
Thus, minDistance and maxDistance is 5 - 2 = 3.
Note that the last node is not considered a local maxima because it does not have a next node.

```

 

**Constraints:**

	The number of nodes in the list is in the range [2, 105].
	1 <= Node.val <= 105

            {% raw %}
            ```c
            /**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
/**
 * Note: The returned array must be malloced, assume caller calls free().
 */
int* nodesBetweenCriticalPoints(struct ListNode* head, int* returnSize) {
    int* arr1 = malloc(2 * sizeof(int));
    *returnSize = 2;
    if (head == NULL || head->next == NULL || head -> next -> next == NULL) {
        arr1[0] = -1;
        arr1[1] = -1;
        return arr1;
    }
    struct ListNode* first = head;
    struct ListNode* second = head->next;
    struct ListNode* third = head->next -> next;
    int* arr = malloc(100000 * sizeof(int));
    int size = 0;
    int index = 0;
    while(third != NULL) {
        if ((first->val > second->val && second->val < third->val) || 
        (first->val < second->val && second->val > third->val)) {
            arr[size] = index;
            size ++ ;
            
        }
        index ++ ;
        first = first ->next;
        second = second -> next;
        third = third -> next;
    }
    int diff = 100000;
    for (int i = 0 ; i < size-1; i ++){
        if (diff > (arr[i+1] - arr[i])) {
            diff = (arr[i+1] - arr[i]);
        }
    }
    if (size < 2) {
        arr1[0] = -1;
        arr1[1] = -1;
        return arr1;
    }
    arr1[0] = diff;
    arr1[1] = arr[size-1] - arr[0];
    return arr1;

}
            {% endraw %}
            