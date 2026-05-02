---
            title: "804 Rotated Digits"
            date: "2026-05-02T08:22:41+02:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Rotated Digits](https://leetcode.com/problems/rotated-digits) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

An integer x is a **good** if after rotating each digit individually by 180 degrees, we get a valid number that is different from x. Each digit must be rotated - we cannot choose to leave it alone.

A number is valid if each digit remains a digit after rotation. For example:

	0, 1, and 8 rotate to themselves,
	2 and 5 rotate to each other (in this case they are rotated in a different direction, in other words, 2 or 5 gets mirrored),
	6 and 9 rotate to each other, and
	the rest of the numbers do not rotate to any other number and become invalid.

Given an integer n, return *the number of **good** integers in the range *[1, n].

 

Example 1:

```

**Input:** n = 10
**Output:** 4
**Explanation:** There are four good numbers in the range [1, 10] : 2, 5, 6, 9.
Note that 1 and 10 are not good numbers, since they remain unchanged after rotating.

```

Example 2:

```

**Input:** n = 1
**Output:** 0

```

Example 3:

```

**Input:** n = 2
**Output:** 1

```

 

**Constraints:**

	1 <= n <= 104

{% raw %}


```rust


impl Solution {
    pub fn rotated_digits(n: i32) -> i32 {
        /*
        for 10 - we have 4
        1,0,2,5,6,9
        any number made with this combination will be rottaed, may not be valid ans though
        if n = 30
        all 1 digit + 
        fix first digit at 1,2 -> 
        second digit can be 6 combination
        so total 12 ? no
        number must have a 2,5,6,9 -> 10 in total
        so if n = 100
        all 1 digit , all 2 digit and no 3 digit
        n = 135
        0,1 | 1 , 0 ,2 , 6, 9 | 1, 0 , 2, 5,  6,9
        */

        let mut combis : Vec<Vec<i32>> = Vec::new();
        let valid_arr = [0,1,2,5,6,9, 8];
        let mut k  = n;

        

        while k > 9 {
            let mut remaining = k % 10;
            k = k /10 ;
            let mut arr = Vec::new();
            for m in &valid_arr {
                    arr.push(*m);
            }
            
            combis.push(arr.clone());
        }
        let mut arr = Vec::new();
        for m in &valid_arr {
                if k >= *m {
                    arr.push(*m);
                }
        }
        combis.push(arr.clone());
        combis = combis.clone().into_iter().rev().collect();
        print!("{:?} {:?}", arr.clone(), combis.clone());

        fn recurse(combi : Vec<Vec<i32>>, contains_valid_digits : bool, level : usize, n : i32 , prev : i32) -> i32 {
            if level == combi.len()  
            {
                if n >= prev && contains_valid_digits{
                    return 1;
                } else {
                    return 0;
                }
            }
            let mut res = 0;
            let current_level = combi[level].clone();
            for m in &current_level {
                if (*m == 0 || *m == 1 || *m == 8) &&  !contains_valid_digits {
                    res += recurse(combi.clone(),  false, level + 1, n , prev * 10 + *m);
                } else {
                    res += recurse(combi.clone(),  true, level + 1, n, prev * 10 + *m);
                }
                
            }
            res

        }
        return recurse(combis.clone(), false, 0, n , 0);

    }


}


{% endraw %}
```
