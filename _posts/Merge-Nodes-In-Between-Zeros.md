---
title: "Merge Nodes In Between Zeros"
date: "2024-07-04T10:10:20+02:00"
categories: ["leetcode"]
tags: [c]
layout: post
problem_statement: "Time: 369 ms (12.50%) | Memory: 105.4 MB (22.12%) - LeetSync"
---

```c
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     struct ListNode *next;
 * };
 */

int merge(struct ListNode* temp1, struct ListNode* temp2){
    int s = 0;
    struct ListNode* temp3 = temp1->next;
    while(temp3 != temp2){
        //printf("%d", temp3->val);
        s += (temp3->val);
        temp3 = temp3->next;
    }
    
    return s;

}

struct ListNode* mergeNodes(struct ListNode* head) {
    struct ListNode* temp1 = head;
    struct ListNode* temp2 = head;
    struct ListNode* result = malloc(sizeof(struct ListNode)); 
    struct ListNode* result2 = result; 
    struct ListNode* result3 = result; 
    while(temp2 != NULL) {
        //printf("%d %d\n", temp1->val, temp2->val);
        if (temp1->val != 0 && temp2->val != 0) {
            
            temp1 = temp1->next;
            temp2 = temp2->next;
            continue;
        }

        if (temp1->val != 0 ){
            temp1 = temp1->next;
            continue;
        }

        if (temp2->val != 0) {
            temp2 = temp2->next;
            continue;
        }

        if (temp1 == temp2 && temp1->val == 0) {
            temp2 = temp2->next;
            continue;
        }

        if (temp1->val == 0 && temp2->val == 0) {
            //merge
            
            int s = merge(temp1, temp2);
            //printf("%d--\n", s);
            result2->val = s;
            result2->next = malloc(sizeof(struct ListNode));
            result3 = result2;
            result2 = result2->next;
            temp1 = temp1->next;
            temp2 = temp2->next;
            //printf("%d --%d\n", temp1->val, temp2->val);
            
        }

    }
    result3->next= NULL;
    
    

    return result;
}
```