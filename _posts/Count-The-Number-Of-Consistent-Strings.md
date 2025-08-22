---
title: "Count The Number Of Consistent Strings"
date: "2024-09-12T07:32:25+02:00"
categories: ["leetcode"]
tags: [c]
layout: post
problem_statement: "Time: 55 ms (32.26%) | Memory: 14.3 MB (96.77%) - LeetSync"
---

```c


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
```