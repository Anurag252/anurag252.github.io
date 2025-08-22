---
            title: "1895 Minimum Number Of Operations To Move All Balls To Each Box"
            date: "2025-01-06T13:15:45+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Minimum Number of Operations to Move All Balls to Each Box](https://leetcode.com/problems/minimum-number-of-operations-to-move-all-balls-to-each-box) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You have n boxes. You are given a binary string boxes of length n, where boxes[i] is '0' if the ith box is **empty**, and '1' if it contains **one** ball.

In one operation, you can move **one** ball from a box to an adjacent box. Box i is adjacent to box j if abs(i - j) == 1. Note that after doing so, there may be more than one ball in some boxes.

Return an array answer of size n, where answer[i] is the **minimum** number of operations needed to move all the balls to the ith box.

Each answer[i] is calculated considering the **initial** state of the boxes.

 

Example 1:

```

**Input:** boxes = "110"
**Output:** [1,1,3]
**Explanation:** The answer for each box is as follows:
1) First box: you will have to move one ball from the second box to the first box in one operation.
2) Second box: you will have to move one ball from the first box to the second box in one operation.
3) Third box: you will have to move one ball from the first box to the third box in two operations, and move one ball from the second box to the third box in one operation.

```

Example 2:

```

**Input:** boxes = "001011"
**Output:** [11,8,5,4,3,4]
```

 

**Constraints:**

	n == boxes.length
	1 <= n <= 2000
	boxes[i] is either '0' or '1'.

{% raw %}


```python


class Solution:
    def minOperations(self, boxes: str) -> List[int]:
        """
        [. . . . . x . . . .]
        to calculate the number of moves , you must know where are 1s in arr and how far 
        let's say 1, 3 
        x-1, x-3 is the dist 
        similarly in revrse arr n-x-1th elem find 1s and their sum
        x1 . x2 . x3 . x4 . x4 .. xn
        xn - x1 + xn - x2 + xn- x3 ..
        nXn - (x1+x2+x3)

        """
        pref = []
        suff = []
        temp = 0
        count = 0
        for idx, k in enumerate(boxes):
            if k == "1":
                temp += idx
                count += 1
            pref.append((temp, count))

        temp = 0
        count = 0
        for idx, k in enumerate(boxes[::-1]):
            if k == "1":
                temp += idx
                count += 1
            suff.append((temp, count))
        res = []
        for idx, k in enumerate(pref):
            left  =  k[1] * idx - k[0]
            right_idx = len(pref) - 1 - idx
            right = suff[right_idx][1] * right_idx - suff[right_idx][0]
            res.append(left + right)
        return res
        """
        print(pref, suff)
        2*1 - 1 + 1-1
        2*2-1 + 0
        count * idx - sum
        """



        


        


{% endraw %}
```
