---
title: "Sliding Puzzle"
date: "2024-11-25T09:58:56+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 443 ms (5.02%) | Memory: 17.4 MB (11.88%) - LeetSync"
---

```python
class Solution:
    def slidingPuzzle(self, board: List[List[int]]) -> int:
        s = {}
        a = 0
        b = 0
        for i in range(0, len(board)):
            for j in range(0, len(board[0])):
                if board[i][j] == 0:
                    a = i
                    b = j
                    break

        

        INF = 10 ** 8
        def is_solved(board, d):
            #print("abc")
            return d == tuple([1,2,3,4,5,0])


        def swap(board, i , j , c, d):
            board[i][j], board[c][d] = board[c][d], board[i][j]
        
        def recurse(board, i , j, moves):
            v = tuple(board[0] + board[1])
            if v in s and s[v] <= moves:
                return
            result = INF
            if is_solved(board, v):
                #print("some data")
                if v in s:
                    s[v] = min(s[v], moves)
                    return
                s[v] = moves
                return
            s[v] = moves

            dir = [(-1,0), (1,0), (0,1), (0 , -1)]
            for k in dir:
                if 0 <= i + k[0] < 2 and 0 <= j + k[1] < 3:
                    swap(board, i , j , i + k[0] , j + k[1])
                    recurse(board,i+k[0], j+ k [1], moves + 1 )
                    swap(board,  i + k[0], j + k[1], i ,j)
                    
        recurse(board, a, b, 0)
        #print(s[tuple([1,2,3,4,5,0])])
        return s[tuple([1,2,3,4,5,0])] if tuple([1,2,3,4,5,0]) in s else -1

            

            
```