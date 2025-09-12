---
            title: "3462 Vowels Game In A String"
            date: "2025-09-12T09:48:53+02:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Vowels Game in a String](https://leetcode.com/problems/vowels-game-in-a-string) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Alice and Bob are playing a game on a string.

You are given a string s, Alice and Bob will take turns playing the following game where Alice starts **first**:

	On Alice's turn, she has to remove any **non-empty** substring from s that contains an **odd** number of vowels.
	On Bob's turn, he has to remove any **non-empty** substring from s that contains an **even** number of vowels.

The first player who cannot make a move on their turn loses the game. We assume that both Alice and Bob play **optimally**.

Return true if Alice wins the game, and false otherwise.

The English vowels are: a, e, i, o, and u.

 

Example 1:

**Input:** s = "leetcoder"

**Output:** true

**Explanation:**

Alice can win the game as follows:

	Alice plays first, she can delete the underlined substring in s = "**leetco**der" which contains 3 vowels. The resulting string is s = "der".
	Bob plays second, he can delete the underlined substring in s = "**d**er" which contains 0 vowels. The resulting string is s = "er".
	Alice plays third, she can delete the whole string s = "**er**" which contains 1 vowel.
	Bob plays fourth, since the string is empty, there is no valid play for Bob. So Alice wins the game.

Example 2:

**Input:** s = "bbcd"

**Output:** false

**Explanation:**

There is no valid play for Alice in her first turn, so Alice loses the game.

 

**Constraints:**

	1 <= s.length <= 105
	s consists only of lowercase English letters.

{% raw %}


```python


class Solution:
    def doesAliceWin(self, s: str) -> bool:
        """
            Does it makes sense to delete longest string possible 
            odd + even = odd
            so if alice does not pick longest , then bob gets to pick even 
            and bob must pick longest even so alice get's none
        """

        arr = []
        temp = 0
        for k in s:
            if k == 'a' or k == 'e' or k == 'i' or k == 'o' or k == 'u':
                temp += 1
            arr.append(temp)
        if temp == 0:
            return False
        return True
        
        right = len(arr) - 1
        alice_turn = True
        while(right >= 0):
            is_odd = True
            if arr[right] % 2 == 0:
                is_odd = False
            if alice_turn:
                return

            

        



{% endraw %}
```
