---
            title: "3501 Delete Nodes From Linked List Present In Array"
            date: "2024-09-06T08:58:59+02:00"
            categories: ["leetcode"]
            tags: [go]
            layout: post
---
            
## [Delete Nodes From Linked List Present in Array](https://leetcode.com/problems/delete-nodes-from-linked-list-present-in-array) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given an array of integers nums and the head of a linked list. Return the head of the modified linked list after **removing** all nodes from the linked list that have a value that exists in nums.

 

Example 1:

**Input:** nums = [1,2,3], head = [1,2,3,4,5]

**Output:** [4,5]

**Explanation:**

**![image](https://assets.leetcode.com/uploads/2024/06/11/linkedlistexample0.png)**

Remove the nodes with values 1, 2, and 3.

Example 2:

**Input:** nums = [1], head = [1,2,1,2,1,2]

**Output:** [2,2,2]

**Explanation:**

![image](https://assets.leetcode.com/uploads/2024/06/11/linkedlistexample1.png)

Remove the nodes with value 1.

Example 3:

**Input:** nums = [5], head = [1,2,3,4]

**Output:** [1,2,3,4]

**Explanation:**

**![image](https://assets.leetcode.com/uploads/2024/06/11/linkedlistexample2.png)**

No node has value 5.

 

**Constraints:**

	1 <= nums.length <= 105
	1 <= nums[i] <= 105
	All elements in nums are unique.
	The number of nodes in the given list is in the range [1, 105].
	1 <= Node.val <= 105
	The input is generated such that there is at least one node in the linked list that has a value not present in nums.

{% raw %}


```go


/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func modifiedList(nums []int, head *ListNode) *ListNode {
    var prev *ListNode = nil
    sort.Ints(nums)
    temp := head
    for temp != nil {
        //found := false
        if binSearch(nums, temp.Val) {
                    if (prev == nil) {
                        //fmt.Println(temp.Val, head.Val, "B")
                        temp = temp.Next
                        head = head.Next

                    } else {
                        //fmt.Println(temp.Val, head.Val, "A")
                        prev.Next = temp.Next
                        temp = temp.Next
                    }
                } else {
                     prev = temp
                    temp = temp.Next
                }
            }
            
    
    return head
}
func binSearch(arr []int, val int) bool {
    start := 0
    end := len(arr)-1

    for start <= end {
        mid := (start + end)/2
        if (arr[mid] < val){
            start = mid + 1
            continue
        }

        if (arr[mid] > val){
            end = mid - 1
            continue
        }

        if (arr[mid] == val){
           return true
        }
    }
    //fmt.Println(arr, val)
    return false
}



{% endraw %}
