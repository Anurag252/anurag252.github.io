---
title: "Maximum Total Importance Of Roads"
date: "2024-06-28T11:50:08+02:00"
categories: ["leetcode"]
tags: [c]
layout: post
problem_statement: "Time: 377 ms (20.00%) | Memory: 39.9 MB (20.00%) - LeetSync"
---

```c
struct couple {
    int key;
    int value;
};

int compare(const void *elem1, const void *elem2) {
    int v1 = (*(struct couple**)elem1)->value;
    int v2 = (*(struct couple**)elem2)->value;
    return v2-v1;
}

long long maximumImportance(int n, int** roads, int roadsSize, int* roadsColSize) {
     int list_of_nodes[n];
    for (int i = 0 ; i < n ; i ++) {
        list_of_nodes[i] = 0;
    }

    for (int i = 0 ; i < roadsSize ; i ++) {
        list_of_nodes[roads[i][0]] ++ ;
        list_of_nodes[roads[i][1]] ++ ;
    }


    struct couple* list_of_nodes_with_kv[n];
    for (int i = 0; i < n; i++) {
        // Allocate memory for each struct couple
        list_of_nodes_with_kv[i] = malloc(sizeof(struct couple));
        // Assign the values to the struct couple
        list_of_nodes_with_kv[i]->key = i;
        list_of_nodes_with_kv[i]->value = list_of_nodes[i];
    }
    qsort(list_of_nodes_with_kv, n, sizeof(struct couple*), compare);

    for (int i = 0 ; i < n; i++) {
        printf("  %d  %d ", list_of_nodes_with_kv[i]->key, list_of_nodes_with_kv[i]-> value);
    }

    int cache[n];
    int top = n;
    for (int i = 0 ; i < n ; i ++) {
        cache[list_of_nodes_with_kv[i]->key] = top;
        top --;
    }
    long result = 0;
    for (int i = 0 ; i < roadsSize ; i ++) {
        result += cache[roads[i][0]];
        result += cache[roads[i][1]];
    }

    return result;
}
```