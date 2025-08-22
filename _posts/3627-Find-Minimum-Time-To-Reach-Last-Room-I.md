---
title: "./3627 Find Minimum Time To Reach Last Room I"
date: "2025-05-07T22:46:36+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/find-minimum-time-to-reach-last-room-i">Find Minimum Time to Reach Last Room I</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>There is a dungeon with <code>n x m</code> rooms arranged as a grid.</p>

<p>You are given a 2D array <code>moveTime</code> of size <code>n x m</code>, where <code>moveTime[i][j]</code> represents the <strong>minimum</strong> time in seconds when you can <strong>start moving</strong> to that room. You start from the room <code>(0, 0)</code> at time <code>t = 0</code> and can move to an <strong>adjacent</strong> room. Moving between adjacent rooms takes <em>exactly</em> one second.</p>

<p>Return the <strong>minimum</strong> time to reach the room <code>(n - 1, m - 1)</code>.</p>

<p>Two rooms are <strong>adjacent</strong> if they share a common wall, either <em>horizontally</em> or <em>vertically</em>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<div class="example-block">
<p><strong>Input:</strong> <span class="example-io">moveTime = [[0,4],[4,4]]</span></p>

<p><strong>Output:</strong> <span class="example-io">6</span></p>

<p><strong>Explanation:</strong></p>

<p>The minimum time required is 6 seconds.</p>

<ul>
	<li>At time <code>t == 4</code>, move from room <code>(0, 0)</code> to room <code>(1, 0)</code> in one second.</li>
	<li>At time <code>t == 5</code>, move from room <code>(1, 0)</code> to room <code>(1, 1)</code> in one second.</li>
</ul>
</div>

<p><strong class="example">Example 2:</strong></p>

<div class="example-block">
<p><strong>Input:</strong> <span class="example-io">moveTime = [[0,0,0],[0,0,0]]</span></p>

<p><strong>Output:</strong> <span class="example-io">3</span></p>

<p><strong>Explanation:</strong></p>

<p>The minimum time required is 3 seconds.</p>

<ul>
	<li>At time <code>t == 0</code>, move from room <code>(0, 0)</code> to room <code>(1, 0)</code> in one second.</li>
	<li>At time <code>t == 1</code>, move from room <code>(1, 0)</code> to room <code>(1, 1)</code> in one second.</li>
	<li>At time <code>t == 2</code>, move from room <code>(1, 1)</code> to room <code>(1, 2)</code> in one second.</li>
</ul>
</div>

<p><strong class="example">Example 3:</strong></p>

<div class="example-block">
<p><strong>Input:</strong> <span class="example-io">moveTime = [[0,1],[1,2]]</span></p>

<p><strong>Output:</strong> <span class="example-io">3</span></p>
</div>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>2 &lt;= n == moveTime.length &lt;= 50</code></li>
	<li><code>2 &lt;= m == moveTime[i].length &lt;= 50</code></li>
	<li><code>0 &lt;= moveTime[i][j] &lt;= 10<sup>9</sup></code></li>
</ul>"
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