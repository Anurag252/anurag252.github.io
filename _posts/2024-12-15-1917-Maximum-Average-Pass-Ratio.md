---
            title: "1917 Maximum Average Pass Ratio"
            date: "2024-12-15T11:01:46+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
            ---
            

            ## [Maximum Average Pass Ratio](https://leetcode.com/problems/maximum-average-pass-ratio) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

There is a school that has classes of students and each class will be having a final exam. You are given a 2D integer array classes, where classes[i] = [passi, totali]. You know beforehand that in the ith class, there are totali total students, but only passi number of students will pass the exam.

You are also given an integer extraStudents. There are another extraStudents brilliant students that are **guaranteed** to pass the exam of any class they are assigned to. You want to assign each of the extraStudents students to a class in a way that **maximizes** the **average** pass ratio across **all** the classes.

The **pass ratio** of a class is equal to the number of students of the class that will pass the exam divided by the total number of students of the class. The **average pass ratio** is the sum of pass ratios of all the classes divided by the number of the classes.

Return *the **maximum** possible average pass ratio after assigning the *extraStudents* students. *Answers within 10-5 of the actual answer will be accepted.

 

Example 1:

```

**Input:** classes = [[1,2],[3,5],[2,2]], extraStudents = 2
**Output:** 0.78333
**Explanation:** You can assign the two extra students to the first class. The average pass ratio will be equal to (3/4 + 3/5 + 2/2) / 3 = 0.78333.

```

Example 2:

```

**Input:** classes = [[2,4],[3,9],[4,5],[2,10]], extraStudents = 4
**Output:** 0.53485

```

 

**Constraints:**

	1 <= classes.length <= 105
	classes[i].length == 2
	1 <= passi <= totali <= 105
	1 <= extraStudents <= 105

            {% raw %}
            ```python
            class Solution:
    def maxAverageRatio(self, classes: List[List[int]], extraStudents: int) -> float:
        if len(classes) == 0:
            return 0
        h = []
        for idx, k in enumerate(classes):
            heapq.heappush(h, ( -(k[1] - k[0]) / (k[1] * k[1] + k[1]), idx ))
        
        """
        a/b
        a + 1/b + 1
        a/b - (a + 1)/(b + 1)
        ab +a - ab -b / (bb + b)

        (b-a) / (bb +b)
        """
        
        while(extraStudents > 0):
            #h.sort(key=lambda x : -(x[1] - x[0]) / (x[1] * x[1] + x[1]))
            item1, idx = heapq.heappop(h)
            #print(h)
            classes[idx][0] += 1
            classes[idx][1] += 1
            heapq.heappush(h, (-(classes[idx][1] - classes[idx][0]) / (classes[idx][1] * classes[idx][1] + classes[idx][1]) , idx))
            extraStudents -= 1
        result = 0
        
        for k in h:
            result += (classes[k[1]][0]/classes[k[1]][1] * 100)
        #print(h, result)
        return (result / len(h)) / 100


        # at each level find the max change that can occur by adding one student
"""
        0.5 0.6 1
        0.66 0.6 1
        0.5 0.66
        """
            {% endraw %}
            