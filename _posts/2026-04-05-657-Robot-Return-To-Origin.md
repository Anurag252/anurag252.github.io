---
            title: "657 Robot Return To Origin"
            date: "2026-04-05T22:00:06+02:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Robot Return to Origin](https://leetcode.com/problems/robot-return-to-origin) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

There is a robot starting at the position (0, 0), the origin, on a 2D plane. Given a sequence of its moves, judge if this robot **ends up at **(0, 0) after it completes its moves.

You are given a string moves that represents the move sequence of the robot where moves[i] represents its ith move. Valid moves are 'R' (right), 'L' (left), 'U' (up), and 'D' (down).

Return true* if the robot returns to the origin after it finishes all of its moves, or *false* otherwise*.

**Note**: The way that the robot is "facing" is irrelevant. 'R' will always make the robot move to the right once, 'L' will always make it move left, etc. Also, assume that the magnitude of the robot's movement is the same for each move.

 

Example 1:

```

**Input:** moves = "UD"
**Output:** true
**Explanation**: The robot moves up once, and then down once. All moves have the same magnitude, so it ended up at the origin where it started. Therefore, we return true.

```

Example 2:

```

**Input:** moves = "LL"
**Output:** false
**Explanation**: The robot moves left twice. It ends up two "moves" to the left of the origin. We return false because it is not at the origin at the end of its moves.

```

 

**Constraints:**

	1 <= moves.length <= 2 * 104
	moves only contains the characters 'U', 'D', 'L' and 'R'.

{% raw %}


```rust


impl Solution {
    pub fn judge_circle(moves: String) -> bool {
        // if R and L is same , U an dD is same
        let mut total_h = 0;
        let mut total_v = 0;
        for k in moves.chars() {
            if k == 'L' {
                total_h += 1
            }

            if k == 'R' {
                total_h -= 1
            }


            if k == 'U' {
                total_v += 1
            }

            if k == 'D' {
                total_v -= 1
            }

        }

        if total_h == 0 && total_v == 0 {
            return true;
        }
        return false;
    }
}


{% endraw %}
```
