---
            title: "1566 Check If A Word Occurs As A Prefix Of Any Word In A Sentence"
            date: "2024-12-02T08:53:25+01:00"
            categories: ["leetcode"]
            tags: [python]
            layout: post
---
            
## [Check If a Word Occurs As a Prefix of Any Word in a Sentence](https://leetcode.com/problems/check-if-a-word-occurs-as-a-prefix-of-any-word-in-a-sentence) ![image](https://img.shields.io/badge/Difficulty-Easy-brightgreen)

Given a sentence that consists of some words separated by a **single space**, and a searchWord, check if searchWord is a prefix of any word in sentence.

Return *the index of the word in *sentence* (**1-indexed**) where *searchWord* is a prefix of this word*. If searchWord is a prefix of more than one word, return the index of the first word **(minimum index)**. If there is no such word return -1.

A **prefix** of a string s is any leading contiguous substring of s.

 

Example 1:

```

**Input:** sentence = "i love eating burger", searchWord = "burg"
**Output:** 4
**Explanation:** "burg" is prefix of "burger" which is the 4th word in the sentence.

```

Example 2:

```

**Input:** sentence = "this problem is an easy problem", searchWord = "pro"
**Output:** 2
**Explanation:** "pro" is prefix of "problem" which is the 2nd and the 6th word in the sentence, but we return 2 as it's the minimal index.

```

Example 3:

```

**Input:** sentence = "i am tired", searchWord = "you"
**Output:** -1
**Explanation:** "you" is not a prefix of any word in the sentence.

```

 

**Constraints:**

	1 <= sentence.length <= 100
	1 <= searchWord.length <= 10
	sentence consists of lowercase English letters and spaces.
	searchWord consists of lowercase English letters.

{% raw %}


```python


class Node:
    def __init__(self):
        self.end = False
        self.mp = {}
        self.curr = ""
        self.count = []


class Trie:
    def __init__(self):
        self.root = Node()
        self.temp = self.root
        

    def insert(self, s, temp, count):
        
        if temp == None:
            temp = self.root
        print(s, temp.mp)
        if len(s) == 0:
            return
        set_end = False
        if s[0] in temp.mp:
            temp.count.append((count, s[0]))
            temp = temp.mp[s[0]]
            self.insert(s[1:], temp, count)

        else:
            temp.mp[s[0]] = Node()
            temp.curr = s[0]
            temp.count.append((count, s[0]))
            temp = temp.mp[s[0]]
            print(temp)
            self.insert(s[1:], temp, count)

    def isprefix(self, s, temp):
       
        if temp == None:
            temp = self.root
            #return min(temp.count) if s[0] in temp.mp  and len(temp.count) > 0 else -1 #and temp[s[0]].end

        #print(s, temp.mp, temp.count)
        #isending = False
        if len(s) == 1 and s[0] in temp.mp:
                #print(temp.count)
                for k in temp.count:
                    if k[1] == s:
                        return k[0]
                return -1
        
        if s[0] in temp.mp:
            return self.isprefix(s[1:], temp.mp[s[0]]) 
        else:
            return -1



class Solution:
    def isPrefixOfWord(self, sentence: str, searchWord: str) -> int:
        t = Trie()
        for idx,k in enumerate(sentence.split(' ')):
            t.insert(k, None, idx+1)
            #print(t)
        return t.isprefix(searchWord, None)


        


{% endraw %}
