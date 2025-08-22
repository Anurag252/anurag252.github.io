---
title: "2299 Merge Nodes In Between Zeros"
date: "2024-07-04T10:10:20+02:00"
categories: ["leetcode"]
tags: [c]
layout: post
problem_statement: |
  ## [Merge Nodes in Between Zeros](https://leetcode.com/problems/merge-nodes-in-between-zeros) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)
  
  You are given the head of a linked list, which contains a series of integers **separated** by 0&#39;s. The **beginning** and **end** of the linked list will have Node.val == 0.
  
  For **every **two consecutive 0&#39;s, **merge** all the nodes lying in between them into a single node whose value is the **sum** of all the merged nodes. The modified list should not contain any 0&#39;s.
  
  Return *the* head *of the modified linked list*.
  
  &nbsp;
  
  Example 1:
  
  ![image](https://assets.leetcode.com/uploads/2022/02/02/ex1-1.png)
  ```
  
  **Input:** head = [0,3,1,0,4,5,2,0]
  **Output:** [4,11]
  **Explanation:** 
  The above figure represents the given linked list. The modified list contains
  - The sum of the nodes marked in green: 3 + 1 = 4.
  - The sum of the nodes marked in red: 4 + 5 + 2 = 11.
  
  ```
  
  Example 2:
  
  ![image](https://assets.leetcode.com/uploads/2022/02/02/ex2-1.png)
  ```
  
  **Input:** head = [0,1,0,3,0,2,2,0]
  **Output:** [1,3,4]
  **Explanation:** 
  The above figure represents the given linked list. The modified list contains
  - The sum of the nodes marked in green: 1 = 1.
  - The sum of the nodes marked in red: 3 = 3.
  - The sum of the nodes marked in yellow: 2 + 2 = 4.
  
  ```
  
  &nbsp;
  
  **Constraints:**
  
  	The number of nodes in the list is in the range [3, 2 * 105].
  	0 &lt;= Node.val &lt;= 1000
  	There are **no** two consecutive nodes with Node.val == 0.
  	The **beginning** and **end** of the linked list have Node.val == 0.
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