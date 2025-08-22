---
            title: "624 Maximum Distance In Arrays"
            date: "2024-08-16T07:29:23+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Maximum Distance in Arrays](https://leetcode.com/problems/maximum-distance-in-arrays) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)null

{% raw %}


````python


class Solution:
    def maxDistance(self, arrays: List[List[int]]) -> int:
        start_elem = []
        end_elem = []
        

        for i,k in enumerate(arrays):
            heapq.heappush(start_elem, (k[0],i))

        for i,k in enumerate(arrays):
            heapq.heappush(end_elem, (-1 * k[len(k)-1],i) ) 
        diff = 0
        min_elem = 0
        max_elem = 0
        is_first = True
        while (len(start_elem) > 0):
            a = heapq.heappop(start_elem)
            b = heapq.heappop(end_elem)
            #print(a,b)
            if a[1] != b[1] and is_first:
                return abs(a[0] + b[0])
            else: 
                if is_first:
                    min_elem = a[0]
                    max_elem = b[0]
                    is_first = False
                else:
                    return max(abs(min_elem + b[0]), abs(max_elem + a[0] ))

        return 0
            
        


{% endraw %}
