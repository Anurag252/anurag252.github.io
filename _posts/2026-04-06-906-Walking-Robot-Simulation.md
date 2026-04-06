---
            title: "906 Walking Robot Simulation"
            date: "2026-04-06T22:43:45+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Walking Robot Simulation](https://leetcode.com/problems/walking-robot-simulation) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

A robot on an infinite XY-plane starts at point (0, 0) facing north. The robot receives an array of integers commands, which represents a sequence of moves that it needs to execute. There are only three possible types of instructions the robot can receive:

	-2: Turn left 90 degrees.
	-1: Turn right 90 degrees.
	1 <= k <= 9: Move forward k units, one unit at a time.

Some of the grid squares are obstacles. The ith obstacle is at grid point obstacles[i] = (xi, yi). If the robot runs into an obstacle, it will stay in its current location (on the block adjacent to the obstacle) and move onto the next command.

Return the **maximum squared Euclidean distance** that the robot reaches at any point in its path (i.e. if the distance is 5, return 25).

**Note:**

	There can be an obstacle at (0, 0). If this happens, the robot will ignore the obstacle until it has moved off the origin. However, it will be unable to return to (0, 0) due to the obstacle.
	North means +Y direction.
	East means +X direction.
	South means -Y direction.
	West means -X direction.

 

Example 1:

**Input:** commands = [4,-1,3], obstacles = []

**Output:** 25

**Explanation: **

The robot starts at (0, 0):

	Move north 4 units to (0, 4).
	Turn right.
	Move east 3 units to (3, 4).

The furthest point the robot ever gets from the origin is (3, 4), which squared is 32 + 42 = 25 units away.

Example 2:

**Input:** commands = [4,-1,4,-2,4], obstacles = [[2,4]]

**Output:** 65

**Explanation:**

The robot starts at (0, 0):

	Move north 4 units to (0, 4).
	Turn right.
	Move east 1 unit and get blocked by the obstacle at (2, 4), robot is at (1, 4).
	Turn left.
	Move north 4 units to (1, 8).

The furthest point the robot ever gets from the origin is (1, 8), which squared is 12 + 82 = 65 units away.

Example 3:

**Input:** commands = [6,-1,-1,6], obstacles = [[0,0]]

**Output:** 36

**Explanation:**

The robot starts at (0, 0):

	Move north 6 units to (0, 6).
	Turn right.
	Turn right.
	Move south 5 units and get blocked by the obstacle at (0,0), robot is at (0, 1).

The furthest point the robot ever gets from the origin is (0, 6), which squared is 62 = 36 units away.

 

**Constraints:**

	1 <= commands.length <= 104
	commands[i] is either -2, -1, or an integer in the range [1, 9].
	0 <= obstacles.length <= 104
	-3 * 104 <= xi, yi <= 3 * 104
	The answer is guaranteed to be less than 231.

{% raw %}


```python


from typing import List
import bisect

class Solution:
    def robotSim(self, commands: List[int], obstacles: List[List[int]]) -> int:
        r = 0
        x = 0
        y = 0
        right = [(0,1), (1,0), (0,-1), (-1,0)]
        obsX = {}  # obsX[col] = sorted list of y values
        obsY = {}  # obsY[row] = sorted list of x values

        for m in obstacles:
            if m[0] not in obsX:
                obsX[m[0]] = []
            bisect.insort(obsX[m[0]], m[1])
            if m[1] not in obsY:
                obsY[m[1]] = []
            bisect.insort(obsY[m[1]], m[0])

        result = 0

        for k in commands:
            if k == -1:
                r = (r + 1) % len(right)
            elif k == -2:
                r = (r - 1) % len(right)
            else:
                dx, dy = right[r]

                if dx == 0:  # vertical movement, check obsX[x]
                    if x in obsX:
                        obs_list = obsX[x]
                        if dy == 1:  # north
                            i = bisect.bisect_right(obs_list, y)
                            if i < len(obs_list):
                                y = min(y + k, obs_list[i] - 1)
                            else:
                                y += k
                        else:  # south
                            i = bisect.bisect_left(obs_list, y) - 1
                            if i >= 0:
                                y = max(y - k, obs_list[i] + 1)
                            else:
                                y -= k
                    else:
                        y += dy * k

                else:  # horizontal movement, check obsY[y]
                    if y in obsY:
                        obs_list = obsY[y]
                        if dx == 1:  # east
                            i = bisect.bisect_right(obs_list, x)
                            if i < len(obs_list):
                                x = min(x + k, obs_list[i] - 1)
                            else:
                                x += k
                        else:  # west
                            i = bisect.bisect_left(obs_list, x) - 1
                            if i >= 0:
                                x = max(x - k, obs_list[i] + 1)
                            else:
                                x -= k
                    else:
                        x += dx * k

                result = max(result, x**2 + y**2)

        return result


{% endraw %}
```
