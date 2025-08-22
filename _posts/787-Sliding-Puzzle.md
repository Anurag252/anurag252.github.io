---
title: "./787 Sliding Puzzle"
date: "2024-11-25T09:58:56+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/sliding-puzzle">Sliding Puzzle</a></h2> <img src='https://img.shields.io/badge/Difficulty-Hard-red' alt='Difficulty: Hard' /><hr><p>On an <code>2 x 3</code> board, there are five tiles labeled from <code>1</code> to <code>5</code>, and an empty square represented by <code>0</code>. A <strong>move</strong> consists of choosing <code>0</code> and a 4-directionally adjacent number and swapping it.</p>

<p>The state of the board is solved if and only if the board is <code>[[1,2,3],[4,5,0]]</code>.</p>

<p>Given the puzzle board <code>board</code>, return <em>the least number of moves required so that the state of the board is solved</em>. If it is impossible for the state of the board to be solved, return <code>-1</code>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>
<img alt="" src="https://assets.leetcode.com/uploads/2021/06/29/slide1-grid.jpg" style="width: 244px; height: 165px;" />
<pre>
<strong>Input:</strong> board = [[1,2,3],[4,0,5]]
<strong>Output:</strong> 1
<strong>Explanation:</strong> Swap the 0 and the 5 in one move.
</pre>

<p><strong class="example">Example 2:</strong></p>
<img alt="" src="https://assets.leetcode.com/uploads/2021/06/29/slide2-grid.jpg" style="width: 244px; height: 165px;" />
<pre>
<strong>Input:</strong> board = [[1,2,3],[5,4,0]]
<strong>Output:</strong> -1
<strong>Explanation:</strong> No number of moves will make the board solved.
</pre>

<p><strong class="example">Example 3:</strong></p>
<img alt="" src="https://assets.leetcode.com/uploads/2021/06/29/slide3-grid.jpg" style="width: 244px; height: 165px;" />
<pre>
<strong>Input:</strong> board = [[4,1,2],[5,0,3]]
<strong>Output:</strong> 5
<strong>Explanation:</strong> 5 is the smallest number of moves that solves the board.
An example path:
After move 0: [[4,1,2],[5,0,3]]
After move 1: [[4,1,2],[0,5,3]]
After move 2: [[0,1,2],[4,5,3]]
After move 3: [[1,0,2],[4,5,3]]
After move 4: [[1,2,0],[4,5,3]]
After move 5: [[1,2,3],[4,5,0]]
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>board.length == 2</code></li>
	<li><code>board[i].length == 3</code></li>
	<li><code>0 &lt;= board[i][j] &lt;= 5</code></li>
	<li>Each value <code>board[i][j]</code> is <strong>unique</strong>.</li>
</ul>"
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