---
title: "Minimum Number Of Moves To Seat Everyone"
date: "2024-06-13T12:27:46+02:00"
categories: ["leetcode"]
tags: [c]
layout: post
problem_statement: "Time: 9 ms (42.72%) | Memory: 5.7 MB (96.85%) - LeetSync"
---

```c
int cmpfunc (const void * a, const void * b) {
   return ( *(int*)a - *(int*)b );
}

int minMovesToSeat(int* seats, int seatsSize, int* students, int studentsSize) {
    qsort(seats, seatsSize, sizeof(int), cmpfunc);
     qsort(students, studentsSize, sizeof(int), cmpfunc);
    int result = 0;
     for (int i = 0 ; i < seatsSize ; i ++){
        if (seats[i] - students[i] > 0) {
            result += seats[i] - students[i];
        } else {
            result +=  students[i] - seats[i] ;
        }
        
     }
     return result;
}
```