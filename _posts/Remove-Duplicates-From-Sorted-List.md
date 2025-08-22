---
title: "Remove Duplicates From Sorted List"
date: "2024-04-27T20:57:17+02:00"
categories: ["leetcode"]
tags: [c]
layout: post
problem_statement: "Time: 0 ms (100.00%) | Memory: 6.5 MB (34.47%) - LeetSync"
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