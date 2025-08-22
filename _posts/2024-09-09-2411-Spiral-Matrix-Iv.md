---
title: "2411 Spiral Matrix Iv"
date: "2024-09-09T10:17:58+02:00"
categories: ["leetcode"]
tags: [go]
layout: post
---


                            ## [Spiral Matrix IV](https://leetcode.com/problems/spiral-matrix-iv) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given two integers m and n, which represent the dimensions of a matrix.

You are also given the head of a linked list of integers.

Generate an m x n matrix that contains the integers in the linked list presented in **spiral** order **(clockwise)**, starting from the **top-left** of the matrix. If there are remaining empty spaces, fill them with -1.

Return *the generated matrix*.

 

Example 1:

![image](https://assets.leetcode.com/uploads/2022/05/09/ex1new.jpg)
```

**Input:** m = 3, n = 5, head = [3,0,2,6,8,1,7,9,4,2,5,5,0]
**Output:** [[3,0,2,6,8],[5,0,-1,-1,1],[5,2,4,9,7]]
**Explanation:** The diagram above shows how the values are printed in the matrix.
Note that the remaining spaces in the matrix are filled with -1.

```

Example 2:

![image](https://assets.leetcode.com/uploads/2022/05/11/ex2.jpg)
```

**Input:** m = 1, n = 4, head = [0,1,2]
**Output:** [[0,1,2,-1]]
**Explanation:** The diagram above shows how the values are printed from left to right in the matrix.
The last space in the matrix is set to -1.
```

 

**Constraints:**

	1 <= m, n <= 105
	1 <= m * n <= 105
	The number of nodes in the list is in the range [1, m * n].
	0 <= Node.val <= 1000

                            {% raw %}
                            ```go
                            /**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func spiralMatrix(m int, n int, head *ListNode) [][]int {
    
    matrix := make([][]int, m)

    // Initialize the matrix with -1
    for i := 0; i < m; i++ {
        matrix[i] = make([]int, n)
        for j := 0; j < n; j++ {
            matrix[i][j] = -1
        }
    }
    
    // Define initial position and direction
    i, j := 0, 0 // Start at the top-left corner
    s1, s2, s3, s4 := true, false, false, false // Direction flags: right, down, left, up
    top, bottom, left, right := 0, m-1, 0, n-1 // Boundaries for the spiral traversal

    // Traverse the linked list and fill the matrix
    for head != nil {
        // Place the current node value in the matrix
        matrix[i][j] = head.Val
        head = head.Next

        // Evaluate directions and update indices
        if s1 { // Moving right
            if j < right {
                j++
            } else { // Switch to moving down
                s1, s2 = false, true
                top++
                i++
            }
        } else if s2 { // Moving down
            if i < bottom {
                i++
            } else { // Switch to moving left
                s2, s3 = false, true
                right--
                j--
            }
        } else if s3 { // Moving left
            if j > left {
                j--
            } else { // Switch to moving up
                s3, s4 = false, true
                bottom--
                i--
            }
        } else if s4 { // Moving up
            if i > top {
                i--
            } else { // Switch to moving right
                s4, s1 = false, true
                left++
                j++
            }
        }
    }

    return matrix
}

                            {% endraw %}
                            