---
title: "83 Remove Duplicates From Sorted List"
date: "2024-04-27T20:57:17+02:00"
categories: ["leetcode"]
tags: [c]
layout: post
problem_statement: |
  ## [Remove Duplicates from Sorted List](https://leetcode.com/problems/remove-duplicates-from-sorted-list) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)
  
  Given the head of a sorted linked list, *delete all duplicates such that each element appears only once*. Return *the linked list **sorted** as well*.
  
  &nbsp;
  
  Example 1:
  
  ![image](https://assets.leetcode.com/uploads/2021/01/04/list1.jpg)
  ```
  
  **Input:** head = [1,1,2]
  **Output:** [1,2]
  
  ```
  
  Example 2:
  
  ![image](https://assets.leetcode.com/uploads/2021/01/04/list2.jpg)
  ```
  
  **Input:** head = [1,1,2,3,3]
  **Output:** [1,2,3]
  
  ```
  
  &nbsp;
  
  **Constraints:**
  
  	The number of nodes in the list is in the range [0, 300].
  	-100 &lt;= Node.val &lt;= 100
  	The list is guaranteed to be **sorted** in ascending order.
---

```c
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */
struct ListNode* deleteDuplicates(struct ListNode* head) {

    if (head == NULL) {
        return head; 
    }
    struct ListNode* prev = head;
    struct ListNode* tmp = head;
    while (prev ->next != NULL && prev ->next -> next != NULL ) {
        tmp = prev -> next;
        if (prev -> val == tmp -> val) {
            prev -> next = tmp -> next;
            free(tmp);
        } else {
            prev = prev -> next;
        }
        //prev = prev -> next;
    }

    if (prev ->next != NULL && prev -> val == prev -> next -> val) {
        prev -> next = NULL;
    }

    return head;
}
```