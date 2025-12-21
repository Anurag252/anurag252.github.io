---
            title: "992 Delete Columns To Make Sorted Ii"
            date: "2025-12-21T18:27:20+01:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Delete Columns to Make Sorted II](https://leetcode.com/problems/delete-columns-to-make-sorted-ii) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given an array of n strings strs, all of the same length.

We may choose any deletion indices, and we delete all the characters in those indices for each string.

For example, if we have strs = ["abcdef","uvwxyz"] and deletion indices {0, 2, 3}, then the final array after deletions is ["bef", "vyz"].

Suppose we chose a set of deletion indices answer such that after deletions, the final array has its elements in **lexicographic** order (i.e., strs[0] <= strs[1] <= strs[2] <= ... <= strs[n - 1]). Return *the minimum possible value of* answer.length.

 

Example 1:

```

**Input:** strs = ["ca","bb","ac"]
**Output:** 1
**Explanation:** 
After deleting the first column, strs = ["a", "b", "c"].
Now strs is in lexicographic order (ie. strs[0] <= strs[1] <= strs[2]).
We require at least 1 deletion since initially strs was not in lexicographic order, so the answer is 1.

```

Example 2:

```

**Input:** strs = ["xc","yb","za"]
**Output:** 0
**Explanation:** 
strs is already in lexicographic order, so we do not need to delete anything.
Note that the rows of strs are not necessarily in lexicographic order:
i.e., it is NOT necessarily true that (strs[0][0] <= strs[0][1] <= ...)

```

Example 3:

```

**Input:** strs = ["zyx","wvu","tsr"]
**Output:** 3
**Explanation:** We have to delete every column.

```

 

**Constraints:**

	n == strs.length
	1 <= n <= 100
	1 <= strs[i].length <= 100
	strs[i] consists of lowercase English letters.

{% raw %}


```rust


use std::collections::HashSet;

impl Solution {
    pub fn min_deletion_size(strs: Vec<String>) -> i32 {
        print!("{:?}", strs);
        let mut hs: HashSet<usize> = HashSet::new();

        for (i, k) in strs.iter().enumerate() {
            for l in strs[i..].iter() {
                if k > l {
                    for (x, (m, n)) in k.chars().zip(l.chars()).enumerate() {
                    
                    if m > n {
                        // we must skip the index
                        hs.insert(x);
                        break;
                    }
                }
                }
                
                if hs.len() > 0 {
                    break;
                }
            }
            if hs.len() > 0 {
                break;
            }
        }

        if hs.len() == 0 {
                return 0;
            }

        let mut new_arr = Vec::new();

        for m in strs.clone() {
            let mut a = Vec::new();
            for (i,l) in m.chars().enumerate() {
                if hs.contains(&i){
                    continue;
                }
                a.push(l);
            }
            new_arr.push(a.into_iter().collect());
        }

        return 1 + Self::min_deletion_size(new_arr);

        hs.len() as i32
    }
}



{% endraw %}
```
