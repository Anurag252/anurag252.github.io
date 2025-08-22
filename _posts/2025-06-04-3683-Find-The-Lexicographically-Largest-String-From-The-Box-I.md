---
title: "3683 Find The Lexicographically Largest String From The Box I"
date: "2025-06-04T22:35:29+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
---


                            ## [Find the Lexicographically Largest String From the Box I](https://leetcode.com/problems/find-the-lexicographically-largest-string-from-the-box-i) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given a string word, and an integer numFriends.

Alice is organizing a game for her numFriends friends. There are multiple rounds in the game, where in each round:

	word is split into numFriends **non-empty** strings, such that no previous round has had the **exact** same split.
	All the split words are put into a box.

Find the lexicographically largest string from the box after all the rounds are finished.

 

Example 1:

**Input:** word = "dbca", numFriends = 2

**Output:** "dbc"

**Explanation:** 

All possible splits are:

	"d" and "bca".
	"db" and "ca".
	"dbc" and "a".

Example 2:

**Input:** word = "gggg", numFriends = 4

**Output:** "g"

**Explanation:** 

The only possible split is: "g", "g", "g", and "g".

 

**Constraints:**

	1 <= word.length <= 5 * 103
	word consists only of lowercase English letters.
	1 <= numFriends <= word.length

                            {% raw %}
                            ```python
                            class Solution:
    def answerString(self, words: str, numFriends: int) -> str:
        """
        use higher letter, 
        then higher length
        if we enumerate all splits in 2 grps - we take n 
        in size 3 we need n2
        so k grps n^k 
        largest size of string can be len-k + 1,
         then look for at lest len-k length string from largest char ,
         if not possible then go smaller 

        if we want largest , then look for 
        """
        mn = 'a'
        idx = -1
        for m, k in enumerate(words):
            if mn < k:
                mn = k
        
        idxs = []
        for m, k in enumerate(words):
            if k == mn:
                idxs.append(m)

        # smaller case is still pending
        # in case numFriends grps 
        if numFriends == 1:
            return words
        res = []
        for idx in idxs:
            if idx + len(words) - numFriends + 1 < len(words):
                res.append(words[idx: idx + len(words)-numFriends + 1])
            else :
                res.append(words[idx:])
        res.sort()
        return res[-1]



                            {% endraw %}
                            