---
title: "Find The Minimum And Maximum Number Of Nodes Between Critical Points"
date: "2024-07-05T08:56:49+02:00"
categories: ["leetcode"]
tags: [c]
layout: post
problem_statement: "Time: 120 ms (61.54%) | Memory: 54.3 MB (11.54%) - LeetSync"
---

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
```