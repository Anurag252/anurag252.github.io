---
            title: "3934 Coupon Code Validator"
            date: "2025-12-13T20:34:45+01:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [Coupon Code Validator](https://leetcode.com/problems/coupon-code-validator) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

You are given three arrays of length n that describe the properties of n coupons: code, businessLine, and isActive. The ith coupon has:

	code[i]: a **string** representing the coupon identifier.
	businessLine[i]: a **string** denoting the business category of the coupon.
	isActive[i]: a **boolean** indicating whether the coupon is currently active.

A coupon is considered **valid** if all of the following conditions hold:

	code[i] is non-empty and consists only of alphanumeric characters (a-z, A-Z, 0-9) and underscores (_).
	businessLine[i] is one of the following four categories: "electronics", "grocery", "pharmacy", "restaurant".
	isActive[i] is **true**.

Return an array of the **codes** of all valid coupons, **sorted** first by their **businessLine** in the order: "electronics", "grocery", "pharmacy", "restaurant", and then by **code** in lexicographical (ascending) order within each category.

 

Example 1:

**Input:** code = ["SAVE20","","PHARMA5","SAVE@20"], businessLine = ["restaurant","grocery","pharmacy","restaurant"], isActive = [true,true,true,true]

**Output:** ["PHARMA5","SAVE20"]

**Explanation:**

	First coupon is valid.
	Second coupon has empty code (invalid).
	Third coupon is valid.
	Fourth coupon has special character @ (invalid).

Example 2:

**Input:** code = ["GROCERY15","ELECTRONICS_50","DISCOUNT10"], businessLine = ["grocery","electronics","invalid"], isActive = [false,true,true]

**Output:** ["ELECTRONICS_50"]

**Explanation:**

	First coupon is inactive (invalid).
	Second coupon is valid.
	Third coupon has invalid business line (invalid).

 

**Constraints:**

	n == code.length == businessLine.length == isActive.length
	1 <= n <= 100
	0 <= code[i].length, businessLine[i].length <= 100
	code[i] and businessLine[i] consist of printable ASCII characters.
	isActive[i] is either true or false.

{% raw %}


```rust


use std::iter::zip;
use std::cmp::Ordering;

impl Solution {
    pub fn validate_coupons(
        code: Vec<String>,
        business_line: Vec<String>,
        is_active: Vec<bool>,
    ) -> Vec<String> {

        fn s(a: &(String, String, bool), b: &(String, String, bool)) -> Ordering {
    let arr = ["electronics", "grocery", "pharmacy", "restaurant"];

    let m = arr.iter().position(|x| x == &a.1).unwrap_or(arr.len());
    let n = arr.iter().position(|x| x == &b.1).unwrap_or(arr.len());

    if m == n {
        return a.0.cmp(&b.0);
    }
    m.cmp(&n)
}


        let mut comb_arr: Vec<(String, String, bool)> = Vec::new();

        // build combined array
        for ((k1, k2), k3) in zip(zip(code, business_line), is_active) {
            comb_arr.push((k1, k2, k3));
        }

        // keep sorting
        comb_arr.sort_by(s);

        let mut res = Vec::new();
        let allowed = ["electronics", "grocery", "pharmacy", "restaurant"];

        // add checks here
        for k in comb_arr {
            // active check
            if !k.2 {
                continue;
            }

            // business line check
            if !allowed.contains(&k.1.as_str()) {
                continue;
            }

            // code non-empty & valid chars
            if k.0.is_empty() {
                continue;
            }

            if !k.0.chars().all(|c| c.is_ascii_alphanumeric() || c == '_') {
                continue;
            }

            res.push(k.0);
        }

        res
    }
}



{% endraw %}
```
