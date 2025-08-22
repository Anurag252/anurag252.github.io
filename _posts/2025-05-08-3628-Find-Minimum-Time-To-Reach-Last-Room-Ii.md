---
            title: "3628 Find Minimum Time To Reach Last Room Ii"
            date: "2025-05-08T23:10:37+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Find Minimum Time to Reach Last Room II](https://leetcode.com/problems/find-minimum-time-to-reach-last-room-ii) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

There is a dungeon with n x m rooms arranged as a grid.

You are given a 2D array moveTime of size n x m, where moveTime[i][j] represents the **minimum** time in seconds when you can **start moving** to that room. You start from the room (0, 0) at time t = 0 and can move to an **adjacent** room. Moving between **adjacent** rooms takes one second for one move and two seconds for the next, **alternating** between the two.

Return the **minimum** time to reach the room (n - 1, m - 1).

Two rooms are **adjacent** if they share a common wall, either *horizontally* or *vertically*.

 

Example 1:

**Input:** moveTime = [[0,4],[4,4]]

**Output:** 7

**Explanation:**

The minimum time required is 7 seconds.

	At time t == 4, move from room (0, 0) to room (1, 0) in one second.
	At time t == 5, move from room (1, 0) to room (1, 1) in two seconds.

Example 2:

**Input:** moveTime = [[0,0,0,0],[0,0,0,0]]

**Output:** 6

**Explanation:**

The minimum time required is 6 seconds.

	At time t == 0, move from room (0, 0) to room (1, 0) in one second.
	At time t == 1, move from room (1, 0) to room (1, 1) in two seconds.
	At time t == 3, move from room (1, 1) to room (1, 2) in one second.
	At time t == 4, move from room (1, 2) to room (1, 3) in two seconds.

Example 3:

**Input:** moveTime = [[0,1],[1,2]]

**Output:** 4

 

**Constraints:**

	2 <= n == moveTime.length <= 750
	2 <= m == moveTime[i].length <= 750
	0 <= moveTime[i][j] <= 109

{% raw %}


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


        


{% endraw %}
```
