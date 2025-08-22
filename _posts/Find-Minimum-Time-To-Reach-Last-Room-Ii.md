---
title: "Find Minimum Time To Reach Last Room Ii"
date: "2025-05-08T23:10:37+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "Time: 2713 ms (38.19%) | Memory: 93.4 MB (56.64%) - LeetSync"
---

```python
class State:
    def __init__(self, x, y, dis):
        self.x = x
        self.y = y
        self.dis = dis

    def __lt__(self, other):
        return self.dis < other.dis

class Solution:
    def minTimeToReach(self, moveTime: List[List[int]]) -> int:
        n = len(moveTime)
        m = len(moveTime[0])
        inf = float("inf")
        d = [[inf] * m for _ in range(n)]
        v = [[0] * m for _ in range(n)]

        dirs = [(1, 0), (-1, 0), (0, 1), (0, -1)]

        d[0][0] = 0
        q = []
        heapq.heappush(q, State(0, 0, 0))

        while q:
            s = heapq.heappop(q)
            if v[s.x][s.y]:
                continue
            if s.x == n - 1 and s.y == m - 1:
                break
            v[s.x][s.y] = 1
            for dx, dy in dirs:
                nx, ny = s.x + dx, s.y + dy
                if not (0 <= nx < n and 0 <= ny < m):
                    continue
                dist = max(d[s.x][s.y], moveTime[nx][ny]) + (s.x + s.y) % 2 + 1
                if d[nx][ny] > dist:
                    d[nx][ny] = dist
                    heapq.heappush(q, State(nx, ny, dist))

        return d[n - 1][m - 1]
        h = [(0,0)]
        t = 0
        row = len(moveTime)
        col = len(moveTime[0])
        visited = set([0, 0])
        odd = True

        while(h):
            temp = []
            t1 = 1000000
            while(h):
                print(t, h)
                index = h.pop(0)
                if index[0] == row-1 and index[1] == col-1:
                    return t
                if t < moveTime[index[0]][index[1]]:
                    t1 = min(t1, moveTime[index[0]][index[1]])
                    temp.append(index)
                else:
                    visited.add(index)
                    if index[1] + 1 < col and (index[0], index[1] + 1) not in visited:
                        temp.append((index[0], index[1] + 1))
                    if index[0] + 1 < row and (index[0] + 1, index[1]) not in visited:
                        temp.append((index[0] + 1, index[1]))
                    if index[1] - 1 >= 0 and (index[0], index[1] - 1) not in visited:
                        temp.append((index[0], index[1] - 1))
                    if index[0] - 1 >= 0 and (index[0] - 1, index[1]) not in visited:
                        temp.append((index[0] - 1, index[1] ))
            if t1 == 1000000:
                t1 = 0
            if odd:
                t = max(t + 1, t1)
                odd = not odd
            else:
                t = max(t + 2, t1)
                odd = not odd
            h = temp


        
```