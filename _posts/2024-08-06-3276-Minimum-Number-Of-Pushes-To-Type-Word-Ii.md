---
            title: "3276 Minimum Number Of Pushes To Type Word Ii"
            date: "2024-08-06T06:52:45+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Minimum Number of Pushes to Type Word II](https://leetcode.com/problems/minimum-number-of-pushes-to-type-word-ii) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a string word containing lowercase English letters.

Telephone keypads have keys mapped with **distinct** collections of lowercase English letters, which can be used to form words by pushing them. For example, the key 2 is mapped with ["a","b","c"], we need to push the key one time to type "a", two times to type "b", and three times to type "c" *.*

It is allowed to remap the keys numbered 2 to 9 to **distinct** collections of letters. The keys can be remapped to **any** amount of letters, but each letter **must** be mapped to **exactly** one key. You need to find the **minimum** number of times the keys will be pushed to type the string word.

Return *the **minimum** number of pushes needed to type *word *after remapping the keys*.

An example mapping of letters to keys on a telephone keypad is given below. Note that 1, *, #, and 0 do **not** map to any letters.

![image](https://assets.leetcode.com/uploads/2023/12/26/keypaddesc.png)

 

Example 1:

![image](https://assets.leetcode.com/uploads/2023/12/26/keypadv1e1.png)
```

**Input:** word = "abcde"
**Output:** 5
**Explanation:** The remapped keypad given in the image provides the minimum cost.
"a" -> one push on key 2
"b" -> one push on key 3
"c" -> one push on key 4
"d" -> one push on key 5
"e" -> one push on key 6
Total cost is 1 + 1 + 1 + 1 + 1 = 5.
It can be shown that no other mapping can provide a lower cost.

```

Example 2:

![image](https://assets.leetcode.com/uploads/2023/12/26/keypadv2e2.png)
```

**Input:** word = "xyzxyzxyzxyz"
**Output:** 12
**Explanation:** The remapped keypad given in the image provides the minimum cost.
"x" -> one push on key 2
"y" -> one push on key 3
"z" -> one push on key 4
Total cost is 1 * 4 + 1 * 4 + 1 * 4 = 12
It can be shown that no other mapping can provide a lower cost.
Note that the key 9 is not mapped to any letter: it is not necessary to map letters to every key, but to map all the letters.

```

Example 3:

![image](https://assets.leetcode.com/uploads/2023/12/27/keypadv2.png)
```

**Input:** word = "aabbccddeeffgghhiiiiii"
**Output:** 24
**Explanation:** The remapped keypad given in the image provides the minimum cost.
"a" -> one push on key 2
"b" -> one push on key 3
"c" -> one push on key 4
"d" -> one push on key 5
"e" -> one push on key 6
"f" -> one push on key 7
"g" -> one push on key 8
"h" -> two pushes on key 9
"i" -> one push on key 9
Total cost is 1 * 2 + 1 * 2 + 1 * 2 + 1 * 2 + 1 * 2 + 1 * 2 + 1 * 2 + 2 * 2 + 6 * 1 = 24.
It can be shown that no other mapping can provide a lower cost.

```

 

**Constraints:**

	1 <= word.length <= 105
	word consists of lowercase English letters.

{% raw %}


```python


class Solution:
    def minimumPushes(self, word: str) -> int:
        d = {}
        for k in word:
            if k in d:
                d[k] += 1
            else :
                d[k] = 1
        l = list(d.items())
        l.sort(reverse=True, key= lambda x : x[1])
        result = 0
        n = 8
        #print(l)
        for k in l:
            result += (k[1] * int(n/8))
            n += 1
        #print(result)
        return result
        
        


{% endraw %}
