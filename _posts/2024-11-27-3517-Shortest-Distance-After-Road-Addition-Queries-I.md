---
            title: "3517 Shortest Distance After Road Addition Queries I"
            date: "2024-11-27T09:08:43+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
            ---
            

            ## [Shortest Distance After Road Addition Queries I](https://leetcode.com/problems/shortest-distance-after-road-addition-queries-i) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given an integer n and a 2D integer array queries.

There are n cities numbered from 0 to n - 1. Initially, there is a **unidirectional** road from city i to city i + 1 for all 0 <= i < n - 1.

queries[i] = [ui, vi] represents the addition of a new **unidirectional** road from city ui to city vi. After each query, you need to find the **length** of the **shortest path** from city 0 to city n - 1.

Return an array answer where for each i in the range [0, queries.length - 1], answer[i] is the *length of the shortest path* from city 0 to city n - 1 after processing the **first **i + 1 queries.

 

Example 1:

**Input:** n = 5, queries = [[2,4],[0,2],[0,4]]

**Output:** [3,2,1]

**Explanation: **

![image](https://assets.leetcode.com/uploads/2024/06/28/image8.jpg)

After the addition of the road from 2 to 4, the length of the shortest path from 0 to 4 is 3.

![image](https://assets.leetcode.com/uploads/2024/06/28/image9.jpg)

After the addition of the road from 0 to 2, the length of the shortest path from 0 to 4 is 2.

![image](https://assets.leetcode.com/uploads/2024/06/28/image10.jpg)

After the addition of the road from 0 to 4, the length of the shortest path from 0 to 4 is 1.

Example 2:

**Input:** n = 4, queries = [[0,3],[0,2]]

**Output:** [1,1]

**Explanation:**

![image](https://assets.leetcode.com/uploads/2024/06/28/image11.jpg)

After the addition of the road from 0 to 3, the length of the shortest path from 0 to 3 is 1.

![image](https://assets.leetcode.com/uploads/2024/06/28/image12.jpg)

After the addition of the road from 0 to 2, the length of the shortest path remains 1.

 

**Constraints:**

	3 <= n <= 500
	1 <= queries.length <= 500
	queries[i].length == 2
	0 <= queries[i][0] < queries[i][1] < n
	1 < queries[i][1] - queries[i][0]
	There are no repeated roads among the queries.

            {% raw %}
            ```python
            class Solution:
    def shortestDistanceAfterQueries(self, n: int, queries: List[List[int]]) -> List[int]:
        #O(q * n)

        paths = {}
        dist = {}
        result = []
        for i in range(1, n):
            paths[i] = [i - 1]

        def traverse(paths, dest, dist, visited):
            #print(paths, dist)
            temp = []
            while(len(dist) > 0):
                a = dist.pop(0)
                if a in visited:
                    continue
                visited.add(a)
                if a not in paths:
                    return 0 # ensure minimum path
                for r in paths[a]:
                    temp.append(r)
            if len(temp) > 0 :
                return 1 + traverse(paths, dest , temp, visited)
            else :
                return 0


        for (u,v) in queries:
            paths[v].append(u)
            #print(paths)
            visited = set()
            result.append(1 + traverse(paths, n-1, copy.deepcopy(paths[n-1]), visited))
            #print(paths, dist)
            #print("abc")
        return result



        
            {% endraw %}
            