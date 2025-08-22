---
            title: "2434 Design A Number Container System"
            date: "2025-02-08T10:08:12+01:00"
            categories: ["leetcode"]
            tags: [go]
            layout: post
            ---
            

            ## [Design a Number Container System](https://leetcode.com/problems/design-a-number-container-system) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Design a number container system that can do the following:

	**Insert **or **Replace** a number at the given index in the system.
	**Return **the smallest index for the given number in the system.

Implement the NumberContainers class:

	NumberContainers() Initializes the number container system.
	void change(int index, int number) Fills the container at index with the number. If there is already a number at that index, replace it.
	int find(int number) Returns the smallest index for the given number, or -1 if there is no index that is filled by number in the system.

 

Example 1:

```

**Input**
["NumberContainers", "find", "change", "change", "change", "change", "find", "change", "find"]
[[], [10], [2, 10], [1, 10], [3, 10], [5, 10], [10], [1, 20], [10]]
**Output**
[null, -1, null, null, null, null, 1, null, 2]

**Explanation**
NumberContainers nc = new NumberContainers();
nc.find(10); // There is no index that is filled with number 10. Therefore, we return -1.
nc.change(2, 10); // Your container at index 2 will be filled with number 10.
nc.change(1, 10); // Your container at index 1 will be filled with number 10.
nc.change(3, 10); // Your container at index 3 will be filled with number 10.
nc.change(5, 10); // Your container at index 5 will be filled with number 10.
nc.find(10); // Number 10 is at the indices 1, 2, 3, and 5. Since the smallest index that is filled with 10 is 1, we return 1.
nc.change(1, 20); // Your container at index 1 will be filled with number 20. Note that index 1 was filled with 10 and then replaced with 20. 
nc.find(10); // Number 10 is at the indices 2, 3, and 5. The smallest index that is filled with 10 is 2. Therefore, we return 2.

```

 

**Constraints:**

	1 <= index, number <= 109
	At most 105 calls will be made **in total** to change and find.

            {% raw %}
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
            {% endraw %}
            