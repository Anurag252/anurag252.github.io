---
title: "2685 First Completely Painted Row Or Column"
date: "2025-01-20T08:03:26+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
---

                            ## [First Completely Painted Row or Column](https://leetcode.com/problems/first-completely-painted-row-or-column) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a **0-indexed** integer array arr, and an m x n integer **matrix** mat. arr and mat both contain **all** the integers in the range [1, m * n].

Go through each index i in arr starting from index 0 and paint the cell in mat containing the integer arr[i].

Return _the smallest index_ i _at which either a row or a column will be completely painted in_ mat.

Example 1:

![image](https://assets.leetcode.com/uploads/2023/01/18/grid1.jpg)

```

**Input:** arr = [1,3,4,2], mat = [[1,4],[2,3]]
**Output:** 2
**Explanation:** The moves are shown in order, and both the first row and second column of the matrix become fully painted at arr[2].

```

Example 2:

![image](https://assets.leetcode.com/uploads/2023/01/18/grid2.jpg)

```

**Input:** arr = [2,8,7,4,1,3,5,6,9], mat = [[3,2,5],[1,4,6],[8,7,9]]
**Output:** 3
**Explanation:** The second column becomes fully painted at arr[3].

```

**Constraints:**

    m == mat.length
    n = mat[i].length
    arr.length == m * n
    1 <= m, n <= 105
    1 <= m * n <= 105
    1 <= arr[i], mat[r][c] <= m * n
    All the integers of arr are **unique**.
    All the integers of mat are **unique**.

                            {% raw %}
                            ```go
                            func firstCompleteIndex(arr []int, mat [][]int) int {
    // cache row and col for all elements from mat
    // maintain another arr of row , and col sizes and initialize each element to col and row
    // read the arr and reduce each row and col , when you reach till 0 return

    mp := make(map[int]string)
    for a, _ := range mat {
        for b, j := range mat[a] {
            //fmt.Println(strconv.Itoa(a) + "$" + strconv.Itoa(b))
            mp[j] = strconv.Itoa(a) + "$" + strconv.Itoa(b)
        }
    }
    //fmt.Println(mp)

    row := make([]int, len(mat))
    col := make([]int, len(mat[0]))

    for a, _ := range row {
        row[a] = len(mat[0])
    }

    for a, _ := range col {
        col[a] = len(mat)
    }

    for i, elem := range arr {
        parts := mp[elem]
        r, _ := strconv.Atoi(strings.Split(parts, "$")[0])
        c, _  := strconv.Atoi(strings.Split(parts, "$")[1])
        row[r] --
        if row[r] == 0 {
            return i
        }

        col[c] --
        if col[c] == 0 {
            return i
        }
    }

    return -1

}
{% endraw %}
