---
title: "./3628 Find Minimum Time To Reach Last Room Ii"
date: "2025-05-08T23:10:37+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/find-minimum-time-to-reach-last-room-ii">Find Minimum Time to Reach Last Room II</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>There is a dungeon with <code>n x m</code> rooms arranged as a grid.</p>

<p>You are given a 2D array <code>moveTime</code> of size <code>n x m</code>, where <code>moveTime[i][j]</code> represents the <strong>minimum</strong> time in seconds when you can <strong>start moving</strong> to that room. You start from the room <code>(0, 0)</code> at time <code>t = 0</code> and can move to an <strong>adjacent</strong> room. Moving between <strong>adjacent</strong> rooms takes one second for one move and two seconds for the next, <strong>alternating</strong> between the two.</p>

<p>Return the <strong>minimum</strong> time to reach the room <code>(n - 1, m - 1)</code>.</p>

<p>Two rooms are <strong>adjacent</strong> if they share a common wall, either <em>horizontally</em> or <em>vertically</em>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<div class="example-block">
<p><strong>Input:</strong> <span class="example-io">moveTime = [[0,4],[4,4]]</span></p>

<p><strong>Output:</strong> 7</p>

<p><strong>Explanation:</strong></p>

<p>The minimum time required is 7 seconds.</p>

<ul>
	<li>At time <code>t == 4</code>, move from room <code>(0, 0)</code> to room <code>(1, 0)</code> in one second.</li>
	<li>At time <code>t == 5</code>, move from room <code>(1, 0)</code> to room <code>(1, 1)</code> in two seconds.</li>
</ul>
</div>

<p><strong class="example">Example 2:</strong></p>

<div class="example-block">
<p><strong>Input:</strong> <span class="example-io">moveTime = [[0,0,0,0],[0,0,0,0]]</span></p>

<p><strong>Output:</strong> 6</p>

<p><strong>Explanation:</strong></p>

<p>The minimum time required is 6 seconds.</p>

<ul>
	<li>At time <code>t == 0</code>, move from room <code>(0, 0)</code> to room <code>(1, 0)</code> in one second.</li>
	<li>At time <code>t == 1</code>, move from room <code>(1, 0)</code> to room <code>(1, 1)</code> in two seconds.</li>
	<li>At time <code>t == 3</code>, move from room <code>(1, 1)</code> to room <code>(1, 2)</code> in one second.</li>
	<li>At time <code>t == 4</code>, move from room <code>(1, 2)</code> to room <code>(1, 3)</code> in two seconds.</li>
</ul>
</div>

<p><strong class="example">Example 3:</strong></p>

<div class="example-block">
<p><strong>Input:</strong> <span class="example-io">moveTime = [[0,1],[1,2]]</span></p>

<p><strong>Output:</strong> 4</p>
</div>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>2 &lt;= n == moveTime.length &lt;= 750</code></li>
	<li><code>2 &lt;= m == moveTime[i].length &lt;= 750</code></li>
	<li><code>0 &lt;= moveTime[i][j] &lt;= 10<sup>9</sup></code></li>
</ul>"
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