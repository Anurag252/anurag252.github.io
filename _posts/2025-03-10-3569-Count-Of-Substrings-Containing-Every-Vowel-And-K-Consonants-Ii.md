---
            title: "3569 Count Of Substrings Containing Every Vowel And K Consonants Ii"
            date: "2025-03-10T13:44:42+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Count of Substrings Containing Every Vowel and K Consonants II](https://leetcode.com/problems/count-of-substrings-containing-every-vowel-and-k-consonants-ii) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a string word and a **non-negative** integer k.

Return the total number of substrings of word that contain every vowel ('a', 'e', 'i', 'o', and 'u') **at least** once and **exactly** k consonants.

 

Example 1:

**Input:** word = "aeioqq", k = 1

**Output:** 0

**Explanation:**

There is no substring with every vowel.

Example 2:

**Input:** word = "aeiou", k = 0

**Output:** 1

**Explanation:**

The only substring with every vowel and zero consonants is word[0..4], which is "aeiou".

Example 3:

**Input:** word = "ieaouqqieaouqq", k = 1

**Output:** 3

**Explanation:**

The substrings with every vowel and one consonant are:

	word[0..5], which is "ieaouq".
	word[6..11], which is "qieaou".
	word[7..12], which is "ieaouq".

 

**Constraints:**

	5 <= word.length <= 2 * 105
	word consists only of lowercase English letters.
	0 <= k <= word.length - 5

{% raw %}


```python


class Solution:
    def _isVowel(self, c: str) -> bool:
        return c == "a" or c == "e" or c == "i" or c == "o" or c == "u"

    def countOfSubstrings(self, word: str, k: int) -> int:
        num_valid_substrings = 0
        start = end = 0
        vowel_count = {}  # Dictionary to keep counts of vowels
        consonant_count = 0  # Count of consonants
        next_consonant = [0] * len(
            word
        )  # Array to compute index of next consonant for all indices
        next_consonant_index = len(word)

        for i in range(len(word) - 1, -1, -1):
            next_consonant[i] = next_consonant_index
            if not self._isVowel(word[i]):
                next_consonant_index = i

        while end < len(word):
            new_letter = word[end]
            if self._isVowel(new_letter):
                vowel_count[new_letter] = vowel_count.get(new_letter, 0) + 1
            else:
                consonant_count += 1

            while (
                consonant_count > k
            ):  # Shrink window if too many consonants are present
                start_letter = word[start]
                if self._isVowel(start_letter):
                    vowel_count[start_letter] -= 1
                    if vowel_count[start_letter] == 0:
                        del vowel_count[start_letter]
                else:
                    consonant_count -= 1
                start += 1

            while (
                start < len(word)
                and len(vowel_count) == 5
                and consonant_count == k
            ):  # Try to shrink if window is valid
                num_valid_substrings += next_consonant[end] - end
                start_letter = word[start]
                if self._isVowel(start_letter):
                    vowel_count[start_letter] -= 1
                    if vowel_count[start_letter] == 0:
                        del vowel_count[start_letter]
                else:
                    consonant_count -= 1
                start += 1

            end += 1

        return num_valid_substrings


{% endraw %}
```
