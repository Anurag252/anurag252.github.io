---
            title: "787 Sliding Puzzle"
            date: "2024-11-25T09:58:56+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
            ---
            

            ## [Sliding Puzzle](https://leetcode.com/problems/sliding-puzzle) ![image](https://img.shields.io/badge/Difficulty-Hard-red)

On an 2 x 3 board, there are five tiles labeled from 1 to 5, and an empty square represented by 0. A **move** consists of choosing 0 and a 4-directionally adjacent number and swapping it.

The state of the board is solved if and only if the board is [[1,2,3],[4,5,0]].

Given the puzzle board board, return *the least number of moves required so that the state of the board is solved*. If it is impossible for the state of the board to be solved, return -1.

 

Example 1:

![image](https://assets.leetcode.com/uploads/2021/06/29/slide1-grid.jpg)
```

**Input:** board = [[1,2,3],[4,0,5]]
**Output:** 1
**Explanation:** Swap the 0 and the 5 in one move.

```

Example 2:

![image](https://assets.leetcode.com/uploads/2021/06/29/slide2-grid.jpg)
```

**Input:** board = [[1,2,3],[5,4,0]]
**Output:** -1
**Explanation:** No number of moves will make the board solved.

```

Example 3:

![image](https://assets.leetcode.com/uploads/2021/06/29/slide3-grid.jpg)
```

**Input:** board = [[4,1,2],[5,0,3]]
**Output:** 5
**Explanation:** 5 is the smallest number of moves that solves the board.
An example path:
After move 0: [[4,1,2],[5,0,3]]
After move 1: [[4,1,2],[0,5,3]]
After move 2: [[0,1,2],[4,5,3]]
After move 3: [[1,0,2],[4,5,3]]
After move 4: [[1,2,0],[4,5,3]]
After move 5: [[1,2,3],[4,5,0]]

```

 

**Constraints:**

	board.length == 2
	board[i].length == 3
	0 <= board[i][j] <= 5
	Each value board[i][j] is **unique**.

            {% raw %}
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

            

            
            {% endraw %}
            