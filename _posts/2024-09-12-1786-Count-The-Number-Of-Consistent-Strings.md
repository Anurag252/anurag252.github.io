---
            title: "1786 Count The Number Of Consistent Strings"
            date: "2024-09-12T07:32:25+02:00"
            categories: ["leetcode"]
            tags: [c]
            layout: post
---
            
## [Count the Number of Consistent Strings](https://leetcode.com/problems/count-the-number-of-consistent-strings) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

You are given a string allowed consisting of **distinct** characters and an array of strings words. A string is **consistent **if all characters in the string appear in the string allowed.

Return* the number of **consistent** strings in the array *words.

 

Example 1:

```

**Input:** allowed = "ab", words = ["ad","bd","aaab","baa","badab"]
**Output:** 2
**Explanation:** Strings "aaab" and "baa" are consistent since they only contain characters 'a' and 'b'.

```

Example 2:

```

**Input:** allowed = "abc", words = ["a","b","c","ab","ac","bc","abc"]
**Output:** 7
**Explanation:** All strings are consistent.

```

Example 3:

```

**Input:** allowed = "cad", words = ["cc","acd","b","ba","bac","bad","ac","d"]
**Output:** 4
**Explanation:** Strings "cc", "acd", "ac", and "d" are consistent.

```

 

**Constraints:**

	1 <= words.length <= 104
	1 <= allowed.length <= 26
	1 <= words[i].length <= 10
	The characters in allowed are **distinct**.
	words[i] and allowed contain only lowercase English letters.

{% raw %}


````c




int countConsistentStrings(char * allowed, char ** words, int wordsSize){
    int result = 0;
    for (int i = 0 ; i < wordsSize; i ++) {
        char * word = words[i];
        
        int k = 0;
        bool matched = true;
        while(word[k] != '\0') {
            int j = 0;
           bool local_matched = false;
            while(allowed[j] != '\0'){
                if (word[k] == allowed[j]) {
                    local_matched = true;
                    break;
                } 
                j ++ ;
            }
            if (! local_matched) {
                matched = false;
                break;
            }
            k ++ ;
        }
        if (matched) {
                result ++ ;
            }
        
    }
    return result;
}


{% endraw %}
