---
title: "./1985 Maximum Subarray Min Product"
date: "2024-04-28T19:15:52+02:00"
categories: ["leetcode"]
tags: [c]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/maximum-subarray-min-product">Maximum Subarray Min-Product</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>The <strong>min-product</strong> of an array is equal to the <strong>minimum value</strong> in the array <strong>multiplied by</strong> the array&#39;s <strong>sum</strong>.</p>

<ul>
	<li>For example, the array <code>[3,2,5]</code> (minimum value is <code>2</code>) has a min-product of <code>2 * (3+2+5) = 2 * 10 = 20</code>.</li>
</ul>

<p>Given an array of integers <code>nums</code>, return <em>the <strong>maximum min-product</strong> of any <strong>non-empty subarray</strong> of </em><code>nums</code>. Since the answer may be large, return it <strong>modulo</strong> <code>10<sup>9</sup> + 7</code>.</p>

<p>Note that the min-product should be maximized <strong>before</strong> performing the modulo operation. Testcases are generated such that the maximum min-product <strong>without</strong> modulo will fit in a <strong>64-bit signed integer</strong>.</p>

<p>A <strong>subarray</strong> is a <strong>contiguous</strong> part of an array.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> nums = [1,<u>2,3,2</u>]
<strong>Output:</strong> 14
<strong>Explanation:</strong> The maximum min-product is achieved with the subarray [2,3,2] (minimum value is 2).
2 * (2+3+2) = 2 * 7 = 14.
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> nums = [2,<u>3,3</u>,1,2]
<strong>Output:</strong> 18
<strong>Explanation:</strong> The maximum min-product is achieved with the subarray [3,3] (minimum value is 3).
3 * (3+3) = 3 * 6 = 18.
</pre>

<p><strong class="example">Example 3:</strong></p>

<pre>
<strong>Input:</strong> nums = [3,1,<u>5,6,4</u>,2]
<strong>Output:</strong> 60
<strong>Explanation:</strong> The maximum min-product is achieved with the subarray [5,6,4] (minimum value is 4).
4 * (5+6+4) = 4 * 15 = 60.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= nums.length &lt;= 10<sup>5</sup></code></li>
	<li><code>1 &lt;= nums[i] &lt;= 10<sup>7</sup></code></li>
</ul>"
---

```c

struct Node;
typedef struct Node *PtrToNode;
typedef PtrToNode Stack;

struct Node
{
    long Element;
    long index;
    PtrToNode Next;
};

bool IsEmpty(Stack S);
Stack CreateStack(void);
void Push(long X, long index, Stack S);
Stack  Pop(Stack S);

int maxSumMinProduct(int* nums, int numsSize) {
    long sumleft[numsSize];
    long sum_left = 0;
    long sumRight[numsSize];
    long sum_right = 0;
    long totalSum = 0;
    long leftMin[numsSize];
    long left_min = 0;
    long rightMin[numsSize];
    long right_min = numsSize - 1;

    long result = 0;

    for (int i = 0 ; i < numsSize; i ++ ){
        //printf("%d kk--", i);
        totalSum = totalSum + *(nums + i);
        
        sum_left = sum_left + *(nums + i);
        sumleft[i] = sum_left;

        sum_right = sum_right + *(nums + numsSize - i-1);
        sumRight[numsSize - i-1] = sum_right;
    }

    Stack S = CreateStack();
    for (int i = 0; i < numsSize ; i ++) {
        //printf("%d ----", i);
        if (!IsEmpty(S) && S -> Next -> Element > *(nums + i)){
            while ( !IsEmpty(S) && S ->Next -> Element > *(nums + i) ) {
             Stack tmp = Pop(S);
             rightMin[tmp -> index] = i;
             free(tmp);
            }
            rightMin[i] = numsSize ;
            Push(*(nums + i), i, S);
        } else {
            Push(*(nums + i), i, S);
            rightMin[i] = numsSize ;
        }
    }
     
    S = CreateStack();
     for (int i = numsSize-1; i >= 0 ; i --) {
        if (!IsEmpty(S) && S ->Next-> Element > *(nums + i)) {
            //printf("\n%d --vvv---\n", S -> Next -> Element);
            while (!IsEmpty(S) && S ->Next -> Element > *(nums + i) ) {
            Stack tmp = Pop(S);
            leftMin[tmp -> index] = i;
            free(tmp);
            }
            leftMin[i] = -1;
            Push(*(nums + i), i, S);
        } else {
            //printf("\n%d --v1v1v1---%d\n", *(nums + i), i);
            Push(*(nums + i), i, S);
            leftMin[i] = -1;
        }        
    }

    for(int i = 0;i < numsSize; i ++){
        //printf("\n %d -- %d -- %dkkk",i, leftMin[i],rightMin[i]);
        if (leftMin[i] >= 0 && rightMin[i] < numsSize) {
            //printf("\n %d -hhh- %d -- %dkkk",i, totalSum - sumleft[leftMin[i]] - sumRight[rightMin[i]],rightMin[i]);
            long temp = (totalSum - sumleft[leftMin[i]] - sumRight[rightMin[i]])* *(nums + i);
            if (temp > result) {
                result = temp;
            }
        } else {
            if (leftMin[i] == -1 && rightMin[i] != numsSize) {
                long temp = (totalSum - sumRight[rightMin[i]])* *(nums + i);
                if (temp > result) {
                    result = temp;
                }
            } else if (leftMin[i] != -1 && rightMin[i] == numsSize) {
                    long temp = (totalSum - sumleft[leftMin[i]])* *(nums + i);
                    if (temp > result) {
                        result = temp;
                    }
            } else {
                long temp = (totalSum)* *(nums + i);
                    if (temp > result) {
                        result = temp;
                    }
            }
            
        }
    }

    return (result % ((int)pow(10,9) + 7)) ; 
}
//1,2,3,2
//0,1,2,2
//3,,2,3



bool IsEmpty(Stack S)
{
    return S->Next == NULL;
}

Stack  Pop(Stack S)
{
    PtrToNode FirstCell;
    FirstCell = S->Next;
    S->Next = S->Next->Next;
    return FirstCell;
}

void Push(long X, long index, Stack S)
{
    PtrToNode TmpCell;
    TmpCell = malloc(sizeof(struct Node));
    TmpCell->Element = X;
    TmpCell->index = index;
    TmpCell->Next = S->Next;
    S->Next = TmpCell;
}

Stack CreateStack(void)
{
    Stack S;
    S = malloc(sizeof(struct Node));
    S->Next = NULL;
   
    while(!IsEmpty(S))
        Pop(S);
    return S;
}


```