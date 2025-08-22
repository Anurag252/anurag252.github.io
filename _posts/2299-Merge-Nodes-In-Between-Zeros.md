---
title: "./2299 Merge Nodes In Between Zeros"
date: "2024-07-04T10:10:20+02:00"
categories: ["leetcode"]
tags: [c]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/merge-nodes-in-between-zeros">Merge Nodes in Between Zeros</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>You are given the <code>head</code> of a linked list, which contains a series of integers <strong>separated</strong> by <code>0</code>&#39;s. The <strong>beginning</strong> and <strong>end</strong> of the linked list will have <code>Node.val == 0</code>.</p>

<p>For <strong>every </strong>two consecutive <code>0</code>&#39;s, <strong>merge</strong> all the nodes lying in between them into a single node whose value is the <strong>sum</strong> of all the merged nodes. The modified list should not contain any <code>0</code>&#39;s.</p>

<p>Return <em>the</em> <code>head</code> <em>of the modified linked list</em>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>
<img alt="" src="https://assets.leetcode.com/uploads/2022/02/02/ex1-1.png" style="width: 600px; height: 41px;" />
<pre>
<strong>Input:</strong> head = [0,3,1,0,4,5,2,0]
<strong>Output:</strong> [4,11]
<strong>Explanation:</strong> 
The above figure represents the given linked list. The modified list contains
- The sum of the nodes marked in green: 3 + 1 = 4.
- The sum of the nodes marked in red: 4 + 5 + 2 = 11.
</pre>

<p><strong class="example">Example 2:</strong></p>
<img alt="" src="https://assets.leetcode.com/uploads/2022/02/02/ex2-1.png" style="width: 600px; height: 41px;" />
<pre>
<strong>Input:</strong> head = [0,1,0,3,0,2,2,0]
<strong>Output:</strong> [1,3,4]
<strong>Explanation:</strong> 
The above figure represents the given linked list. The modified list contains
- The sum of the nodes marked in green: 1 = 1.
- The sum of the nodes marked in red: 3 = 3.
- The sum of the nodes marked in yellow: 2 + 2 = 4.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li>The number of nodes in the list is in the range <code>[3, 2 * 10<sup>5</sup>]</code>.</li>
	<li><code>0 &lt;= Node.val &lt;= 1000</code></li>
	<li>There are <strong>no</strong> two consecutive nodes with <code>Node.val == 0</code>.</li>
	<li>The <strong>beginning</strong> and <strong>end</strong> of the linked list have <code>Node.val == 0</code>.</li>
</ul>"
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