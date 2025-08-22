---
title: "3627 Find Minimum Time To Reach Last Room I"
date: "2025-05-07T22:46:36+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Find Minimum Time to Reach Last Room I](https://leetcode.com/problems/find-minimum-time-to-reach-last-room-i) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)
  
  There is a dungeon with n x m rooms arranged as a grid.
  
  You are given a 2D array moveTime of size n x m, where moveTime[i][j] represents the **minimum** time in seconds when you can **start moving** to that room. You start from the room (0, 0) at time t = 0 and can move to an **adjacent** room. Moving between adjacent rooms takes *exactly* one second.
  
  Return the **minimum** time to reach the room (n - 1, m - 1).
  
  Two rooms are **adjacent** if they share a common wall, either *horizontally* or *vertically*.
  
  &nbsp;
  
  Example 1:
  
  **Input:** moveTime = [[0,4],[4,4]]
  
  **Output:** 6
  
  **Explanation:**
  
  The minimum time required is 6 seconds.
  
  	At time t == 4, move from room (0, 0) to room (1, 0) in one second.
  	At time t == 5, move from room (1, 0) to room (1, 1) in one second.
  
  Example 2:
  
  **Input:** moveTime = [[0,0,0],[0,0,0]]
  
  **Output:** 3
  
  **Explanation:**
  
  The minimum time required is 3 seconds.
  
  	At time t == 0, move from room (0, 0) to room (1, 0) in one second.
  	At time t == 1, move from room (1, 0) to room (1, 1) in one second.
  	At time t == 2, move from room (1, 1) to room (1, 2) in one second.
  
  Example 3:
  
  **Input:** moveTime = [[0,1],[1,2]]
  
  **Output:** 3
  
  &nbsp;
  
  **Constraints:**
  
  	2 &lt;= n == moveTime.length &lt;= 50
  	2 &lt;= m == moveTime[i].length &lt;= 50
  	0 &lt;= moveTime[i][j] &lt;= 109
---

```python
class Solution:
    def minTimeToReach(self, moveTime: List[List[int]]) -> int:
        # idea is that start at end
        # from end look for top and left
        # T[0,0] = min(max(1, a[1,0]) + T[1,0] ,max(1, a[1,0]) +  T[0,1]) 
        # bfs should be ideal


        rows, cols = len(moveTime), len(moveTime[0])
        heap = [(0, 0, 0)]  # (time, i, j)
        visited = set()

        while heap:
            t, i, j = heapq.heappop(heap)

            if (i, j) in visited:
                continue
            visited.add((i, j))

            if i == rows - 1 and j == cols - 1:
                return t

            for di, dj in [(0, 1), (1, 0), (0, -1), (-1, 0)]:
                ni, nj = i + di, j + dj
                if 0 <= ni < rows and 0 <= nj < cols and (ni, nj) not in visited:
                    next_time = max(t + 1, moveTime[ni][nj] + 1)
                    heapq.heappush(heap, (next_time, ni, nj))

        temp = [(0,0)]
        t = 0
        visited = frozenset()
        @cache
        def test(origin, t, visited):
            visited = set(visited)
            if origin[0] == len(moveTime)-1 and origin[1] == len(moveTime[0])-1:
                return t 
            visited.add(origin)
            a, b,c,d = float('inf'), float('inf'), float('inf'), float('inf')
            if origin[0] + 1 < len(moveTime) and (origin[0] + 1, origin[1]) not in visited:
                a = test((origin[0] + 1, origin[1]), max(t+1, moveTime[origin[0] + 1][origin[1]] + 1), frozenset(visited))
            if origin[1] + 1 < len(moveTime[0]) and (origin[0] , origin[1]+1) not in visited:
                b = test((origin[0], origin[1] + 1), max(t+1, moveTime[origin[0]][origin[1] + 1] + 1), frozenset(visited))
            if origin[0] - 1 >= 0 and (origin[0] - 1, origin[1]) not in visited:
                c = test((origin[0] - 1, origin[1]), max(t+1, moveTime[origin[0] - 1][origin[1]] + 1), frozenset(visited))
            if origin[1] - 1 >= 0 and (origin[0], origin[1]-1) not in visited:
                d = test((origin[0], origin[1] - 1), max(t+1, moveTime[origin[0]][origin[1] - 1] + 1), frozenset(visited)) 
            visited.remove(origin)
            return min(a,b,c,d)
        return test((0,0), 0, visited)
            



        while temp:
            print(temp)
            index = temp.pop(0)
            if index in visited:
                continue
            
            t += 1
            if index[0] + 1 < len(moveTime) :
                t1 = moveTime[index[0] + 1][index[1]]
                if t1 > t:
                    temp.append(index)
                else:
                    visited.add((index[0] + 1, index[1]))
                    temp.append((index[0] + 1, index[1]))

            if index[1] + 1 < len(moveTime[0]) :
                t1 = moveTime[index[0]][index[1]+1]
                if t1 > t:
                    temp.append(index)
                else:
                    visited.add((index[0], index[1] + 1))
                    temp.append((index[0], index[1] + 1))
        return t


        
```