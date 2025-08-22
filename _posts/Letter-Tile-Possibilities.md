---
title: "Letter Tile Possibilities"
date: "2025-02-17T18:33:41+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "Time: 75 ms (7.69%) | Memory: 9.9 MB (7.69%) - LeetSync"
---

```go
func numTilePossibilities(tiles string) int {
    // ABCD
    // A,B,C,D
    // AB,AC,AD
    // ABC, ABD, ACD
    mp := make(map[string]bool)
    Comb(tiles, "",  mp)
    fmt.Println(mp)
    return len(mp)
}


func Comb(s string, prev string , mp map[string]bool) {
    
    // ABCD
    //A, B, C , D
    // AB, Ac, AD, BC,BD,...
    // ABC, ACD, A
    // idea is to keep skipping elements 
    //fmt.Println(prev + string(s[i]))
    for i, _ := range s {
        //fmt.Println(prev + string(s[i]))
        Perm(prev + string(s[i]), "" ,mp)
        Comb(s[i+1:], prev + string(s[i]) , mp)
    }

    

}

func Perm(s string, prev string, mp map[string]bool) {
    
    if len(s) == 2 {
        mp[prev + s] = true
        mp[prev + string(s[1]) + string(s[0])] = true
        return
    }

    if len(s) == 1 {
        mp[prev + s] = true
        return
    }

    for i, _ := range s {
        if i + 1 < len(s) {
            Perm(string(s[:i]) + s[i+1:],  prev + string(s[i]) , mp )
        } else {
            Perm(string(s[:i]) ,  prev + string(s[i]) , mp )
        }
    }
}

```