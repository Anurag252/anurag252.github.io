---
title: "./2179 Most Beautiful Item For Each Query"
date: "2024-11-12T12:18:43+01:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/most-beautiful-item-for-each-query">Most Beautiful Item for Each Query</a></h2> <img src='https://img.shields.io/badge/Difficulty-Medium-orange' alt='Difficulty: Medium' /><hr><p>You are given a 2D integer array <code>items</code> where <code>items[i] = [price<sub>i</sub>, beauty<sub>i</sub>]</code> denotes the <strong>price</strong> and <strong>beauty</strong> of an item respectively.</p>

<p>You are also given a <strong>0-indexed</strong> integer array <code>queries</code>. For each <code>queries[j]</code>, you want to determine the <strong>maximum beauty</strong> of an item whose <strong>price</strong> is <strong>less than or equal</strong> to <code>queries[j]</code>. If no such item exists, then the answer to this query is <code>0</code>.</p>

<p>Return <em>an array </em><code>answer</code><em> of the same length as </em><code>queries</code><em> where </em><code>answer[j]</code><em> is the answer to the </em><code>j<sup>th</sup></code><em> query</em>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<pre>
<strong>Input:</strong> items = [[1,2],[3,2],[2,4],[5,6],[3,5]], queries = [1,2,3,4,5,6]
<strong>Output:</strong> [2,4,5,5,6,6]
<strong>Explanation:</strong>
- For queries[0]=1, [1,2] is the only item which has price &lt;= 1. Hence, the answer for this query is 2.
- For queries[1]=2, the items which can be considered are [1,2] and [2,4]. 
  The maximum beauty among them is 4.
- For queries[2]=3 and queries[3]=4, the items which can be considered are [1,2], [3,2], [2,4], and [3,5].
  The maximum beauty among them is 5.
- For queries[4]=5 and queries[5]=6, all items can be considered.
  Hence, the answer for them is the maximum beauty of all items, i.e., 6.
</pre>

<p><strong class="example">Example 2:</strong></p>

<pre>
<strong>Input:</strong> items = [[1,2],[1,2],[1,3],[1,4]], queries = [1]
<strong>Output:</strong> [4]
<strong>Explanation:</strong> 
The price of every item is equal to 1, so we choose the item with the maximum beauty 4. 
Note that multiple items can have the same price and/or beauty.  
</pre>

<p><strong class="example">Example 3:</strong></p>

<pre>
<strong>Input:</strong> items = [[10,1000]], queries = [5]
<strong>Output:</strong> [0]
<strong>Explanation:</strong>
No item has a price less than or equal to 5, so no item can be chosen.
Hence, the answer to the query is 0.
</pre>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= items.length, queries.length &lt;= 10<sup>5</sup></code></li>
	<li><code>items[i].length == 2</code></li>
	<li><code>1 &lt;= price<sub>i</sub>, beauty<sub>i</sub>, queries[j] &lt;= 10<sup>9</sup></code></li>
</ul>"
---

```python
from typing import List

class Solution:
    def maximumBeauty(self, items: List[List[int]], queries: List[int]) -> List[int]:
        # Sort items by their price in ascending order, then by beauty in descending order
        items.sort()
        
        # Precompute the maximum beauty up to each price
        max_beauty = []
        current_max_beauty = 0
        for price, beauty in items:
            current_max_beauty = max(current_max_beauty, beauty)
            max_beauty.append((price, current_max_beauty))
        
        # Function to find the maximum beauty within the price limit using binary search
        def find_max_beauty(price_limit: int) -> int:
            left, right = 0, len(max_beauty) - 1
            while left <= right:
                mid = left + (right - left) // 2
                if max_beauty[mid][0] <= price_limit:
                    left = mid + 1
                else:
                    right = mid - 1
            return max_beauty[right][1] if right >= 0 else 0
        
        # Answer each query using binary search on max_beauty
        ans = []
        for query in queries:
            ans.append(find_max_beauty(query))
        
        return ans

```