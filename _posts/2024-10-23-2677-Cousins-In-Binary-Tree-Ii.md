---
            title: "2677 Cousins In Binary Tree Ii"
            date: "2024-10-23T17:42:30+02:00"
            categories: ["leetcode"]
            tags: [cpp]
            layout: post
            ---
            

            ## [Cousins in Binary Tree II](https://leetcode.com/problems/cousins-in-binary-tree-ii) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

Given the root of a binary tree, replace the value of each node in the tree with the **sum of all its cousins' values**.

Two nodes of a binary tree are **cousins** if they have the same depth with different parents.

Return *the *root* of the modified tree*.

**Note** that the depth of a node is the number of edges in the path from the root node to it.

 

Example 1:

![image](https://assets.leetcode.com/uploads/2023/01/11/example11.png)
```

**Input:** root = [5,4,9,1,10,null,7]
**Output:** [0,0,0,7,7,null,11]
**Explanation:** The diagram above shows the initial binary tree and the binary tree after changing the value of each node.
- Node with value 5 does not have any cousins so its sum is 0.
- Node with value 4 does not have any cousins so its sum is 0.
- Node with value 9 does not have any cousins so its sum is 0.
- Node with value 1 has a cousin with value 7 so its sum is 7.
- Node with value 10 has a cousin with value 7 so its sum is 7.
- Node with value 7 has cousins with values 1 and 10 so its sum is 11.

```

Example 2:

![image](https://assets.leetcode.com/uploads/2023/01/11/diagram33.png)
```

**Input:** root = [3,1,2]
**Output:** [0,0,0]
**Explanation:** The diagram above shows the initial binary tree and the binary tree after changing the value of each node.
- Node with value 3 does not have any cousins so its sum is 0.
- Node with value 1 does not have any cousins so its sum is 0.
- Node with value 2 does not have any cousins so its sum is 0.

```

 

**Constraints:**

	The number of nodes in the tree is in the range [1, 105].
	1 <= Node.val <= 104

            {% raw %}
            ```cpp
            class Solution {
public:
    TreeNode* replaceValueInTree(TreeNode* root) {
        if (!root) return root;

        queue<TreeNode*> nodeQueue;
        nodeQueue.push(root);
        vector<int> levelSums;

        // First BFS: Calculate sum of nodes at each level
        while (!nodeQueue.empty()) {
            int levelSum = 0;
            int levelSize = nodeQueue.size();
            for (int i = 0; i < levelSize; ++i) {
                TreeNode* currentNode = nodeQueue.front();
                nodeQueue.pop();
                levelSum += currentNode->val;
                if (currentNode->left) nodeQueue.push(currentNode->left);
                if (currentNode->right) nodeQueue.push(currentNode->right);
            }
            levelSums.push_back(levelSum);
        }

        // Second BFS: Update each node's value to sum of its cousins
        nodeQueue.push(root);
        int levelIndex = 1;
        root->val = 0;  // Root has no cousins
        while (!nodeQueue.empty()) {
            int levelSize = nodeQueue.size();
            for (int i = 0; i < levelSize; ++i) {
                TreeNode* currentNode = nodeQueue.front();
                nodeQueue.pop();

                int siblingSum =
                    (currentNode->left ? currentNode->left->val : 0) +
                    (currentNode->right ? currentNode->right->val : 0);

                if (currentNode->left) {
                    currentNode->left->val = levelSums[levelIndex] - siblingSum;
                    nodeQueue.push(currentNode->left);
                }
                if (currentNode->right) {
                    currentNode->right->val =
                        levelSums[levelIndex] - siblingSum;
                    nodeQueue.push(currentNode->right);
                }
            }
            ++levelIndex;
        }

        return root;
    }
};
            {% endraw %}
            