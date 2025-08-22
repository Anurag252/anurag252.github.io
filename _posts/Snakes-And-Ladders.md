---
title: "Snakes And Ladders"
date: "2025-05-31T23:13:39+02:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "Time: 12 ms (17.47%) | Memory: 8.9 MB (14.46%) - LeetSync"
---

```go
func snakesAndLadders(board [][]int) int {
    m := len(board)
    dict := make(map[int][2]int)
    x, y := m - 1, -1
    flag := true
    for i := 1; i <= m * m; i++ {
        if flag {
            y++
        } else {
            y--
        }
        if y >= m {
            y--
            x--
            flag = !flag
        } else if y < 0 {
            y++
            x--
            flag = !flag
        }
        dict[i] = [2]int{x, y}
    }

    
    visited := make(map[int]bool)
    visited[1] = true
    queue := []int{1}
    res := 0
    for len(queue) > 0 {
        l := len(queue)
        for i := 0; i < l; i++ {
            for j := 1; j <= 6; j++  {
                v := queue[i] + j
                if v > m * m {
                    break
                }
                if board[dict[v][0]][dict[v][1]] != -1 {
                    v = board[dict[v][0]][dict[v][1]]
                }
                if v == m * m {
                    return res + 1
                }
                if !visited[v] {
                    queue = append(queue, v)
                }
                visited[v] = true      
            }
        }
        queue = queue[l:]
        res++
    }
    return -1
}
```