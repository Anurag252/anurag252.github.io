---
title: "Find Minimum Time To Reach Last Room I"
date: "2025-05-07T22:46:36+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 132 ms (57.74%) | Memory: 18.9 MB (5.51%) - LeetSync"
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