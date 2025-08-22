---
title: "Spiral Matrix Iv"
date: "2024-09-09T10:17:58+02:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "Time: 205 ms (82.61%) | Memory: 21.5 MB (13.04%) - LeetSync"
---

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

```