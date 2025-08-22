---
            title: "9 Palindrome Number"
            date: "2024-07-20T10:28:07+02:00"
            categories: ["leetcode"]
            tags: [c]
            layout: post
---
            
## [Palindrome Number](https://leetcode.com/problems/palindrome-number) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

Given an integer x, return true* if *x* is a ****palindrome****, and *false* otherwise*.

 

Example 1:

```

**Input:** x = 121
**Output:** true
**Explanation:** 121 reads as 121 from left to right and from right to left.

```

Example 2:

```

**Input:** x = -121
**Output:** false
**Explanation:** From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.

```

Example 3:

```

**Input:** x = 10
**Output:** false
**Explanation:** Reads 01 from right to left. Therefore it is not a palindrome.

```

 

**Constraints:**

	-231 <= x <= 231 - 1

 

**Follow up:** Could you solve it without converting the integer to a string?

{% raw %}
```c
bool isPalindrome(int x) {
    int k = 1;
    while(x/k >= 10){
        k = k * 10;
    }
    if (x < 0) {
        return false;
    }
    int l = 10;
    int y = x;
    //printf("%d %d", x/k, y%l);
    while(k >= 1 && y >= 1 && x/k == y%l ){
        x = x % k;
        k = k /10;
        y = y / 10;
    }

    if (x == 0) {
        return true;
    }
    return false;

}
{% endraw %}
