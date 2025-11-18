---
            title: "717 1 Bit And 2 Bit Characters"
            date: "2025-11-18T11:47:16+01:00"
            categories: ["leetcode"]
            tags: [rust]
            layout: post
---
            
## [1-bit and 2-bit Characters](https://leetcode.com/problems/1-bit-and-2-bit-characters) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

We have two special characters:

	The first character can be represented by one bit 0.
	The second character can be represented by two bits (10 or 11).

Given a binary array bits that ends with 0, return true if the last character must be a one-bit character.

 

Example 1:

```

**Input:** bits = [1,0,0]
**Output:** true
**Explanation:** The only way to decode it is two-bit character and one-bit character.
So the last character is one-bit character.

```

Example 2:

```

**Input:** bits = [1,1,1,0]
**Output:** false
**Explanation:** The only way to decode it is two-bit character and two-bit character.
So the last character is not one-bit character.

```

 

**Constraints:**

	1 <= bits.length <= 1000
	bits[i] is either 0 or 1.

{% raw %}


```rust


impl Solution {
    pub fn is_one_bit_character(bits: Vec<i32>) -> bool {
        

        fn recurse(i : i32, arr : Vec<i32>) -> bool {
            //print!("{}", i);
            if i == arr.len()  as i32 - 1{
                return true;
            }

            if i > arr.len()  as i32 - 1{
                return false;
            }

            if i == arr.len() as i32 - 2 && arr[i as usize] == 1 {
                return false;
            }

            if arr[i as usize] == 0 {
                return recurse(i + 1, arr);
            } else {
                // this was 1 and that means 10 or 11
                return recurse(i + 2, arr);
            }
            

        }

        return recurse(0, bits);
    }
}


{% endraw %}
```
