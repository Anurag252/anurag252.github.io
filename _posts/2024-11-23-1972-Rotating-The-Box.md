---
            title: "1972 Rotating The Box"
            date: "2024-11-23T09:00:19+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Rotating the Box](https://leetcode.com/problems/rotating-the-box) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given an m x n matrix of characters box representing a side-view of a box. Each cell of the box is one of the following:

	A stone '#'
	A stationary obstacle '*'
	Empty '.'

The box is rotated **90 degrees clockwise**, causing some of the stones to fall due to gravity. Each stone falls down until it lands on an obstacle, another stone, or the bottom of the box. Gravity **does not** affect the obstacles' positions, and the inertia from the box's rotation **does not **affect the stones' horizontal positions.

It is **guaranteed** that each stone in box rests on an obstacle, another stone, or the bottom of the box.

Return *an *n x m* matrix representing the box after the rotation described above*.

 

Example 1:

![image](https://assets.leetcode.com/uploads/2021/04/08/rotatingtheboxleetcodewithstones.png)

```

**Input:** box = [["#",".","#"]]
**Output:** [["."],
         ["#"],
         ["#"]]

```

Example 2:

![image](https://assets.leetcode.com/uploads/2021/04/08/rotatingtheboxleetcode2withstones.png)

```

**Input:** box = [["#",".","*","."],
              ["#","#","*","."]]
**Output:** [["#","."],
         ["#","#"],
         ["*","*"],
         [".","."]]

```

Example 3:

![image](https://assets.leetcode.com/uploads/2021/04/08/rotatingtheboxleetcode3withstone.png)

```

**Input:** box = [["#","#","*",".","*","."],
              ["#","#","#","*",".","."],
              ["#","#","#",".","#","."]]
**Output:** [[".","#","#"],
         [".","#","#"],
         ["#","#","*"],
         ["#","*","."],
         ["#",".","*"],
         ["#",".","."]]

```

 

**Constraints:**

	m == box.length
	n == box[i].length
	1 <= m, n <= 500
	box[i][j] is either '#', '*', or '.'.

{% raw %}


```python


class Solution:
    def rotateTheBox(self, box: List[List[str]]) -> List[List[str]]:
        ans = []
        for rows in box:
            start = 0
            end = len(rows) - 1
            temp = end
            prev = "."
            res = []
            while(temp >= 0):
                if rows[temp] == "#":
                    m = 0
                    while(len(res) > 0 and res[-1] == "."):
                        m += 1
                        res.pop(-1)
                    res.append("#")
                    while(m > 0):
                        res.append(".")
                        m -= 1

                    temp -= 1
                    continue
                if rows[temp] == ".":
                    res.append(".")
                    temp -= 1
                    continue
                if rows[temp] == "*":
                    res.append("*")
                    temp -= 1
                    continue
            # fill empty at end
            #print(res)
            while(len(res) < len(rows)):
                res.append(".")
            # reverse
            res.reverse()
            ans.append(copy.deepcopy(res))
        ans.reverse()
        row = 0
        col = 0
        result = []
        t = []
        #print(ans)
        while(col < len(ans[0])  and row < len(ans)):
            
            if row == len(ans) - 1:
                t.append(ans[row][col])
                col += 1
                row = 0
                result.append(copy.deepcopy(t))
                t = []
                continue
            t.append(ans[row][col])
            #print(t)
            row += 1
        return result

                    
                

        


{% endraw %}
