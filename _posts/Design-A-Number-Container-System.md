---
title: "Design A Number Container System"
date: "2025-02-08T10:08:12+01:00"
categories: ["leetcode"]
tags: [go]
layout: post
problem_statement: "Time: 173 ms (0.00%) | Memory: 55.8 MB (50.00%) - LeetSync"
---

```go
import (
	"fmt"
	"github.com/emirpasic/gods/trees/redblacktree"
)

// NumberContainers struct
type NumberContainers struct {
	index map[int]int                    // Maps index → number
	num   map[int]*redblacktree.Tree // Maps number → ordered indices
}

// Constructor initializes the NumberContainers structure
func Constructor() NumberContainers {
	return NumberContainers{
		index: make(map[int]int),
		num:   make(map[int]*redblacktree.Tree),
	}
}

// insert inserts index into the Red-Black Tree
func insert(tree *redblacktree.Tree, index int) {
	tree.Put(index, nil) // Red-Black Tree automatically keeps elements sorted
}

// del removes index from the Red-Black Tree
func del(tree *redblacktree.Tree, index int) {
	tree.Remove(index)
}

// Change updates the mapping from index → number and maintains sorted indices
func (this *NumberContainers) Change(index int, number int) {
	oldNumber, exists := this.index[index]

	// Update index map
	this.index[index] = number

	// If the index existed before, remove it from the previous number's tree
	if exists {
		oldTree, ok := this.num[oldNumber]
		if ok {
			del(oldTree, index)
			if oldTree.Size() == 0 {
				delete(this.num, oldNumber) // Remove empty trees
			}
		}
	}

	// Insert into the new number's tree
	_, ok := this.num[number]
	if !ok {
		this.num[number] = redblacktree.NewWithIntComparator()
	}
	insert(this.num[number], index)
}

// Find returns the smallest index associated with the number
func (this *NumberContainers) Find(number int) int {
	tree, ok := this.num[number]
	if !ok || tree.Size() == 0 {
		return -1
	}
	minNode := tree.Left()
	if minNode == nil {
		return -1
	}
	return minNode.Key.(int)
}
```