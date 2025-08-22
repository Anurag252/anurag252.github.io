---
title: "1350 Remove Sub Folders From The Filesystem"
date: "2025-07-19T10:38:27+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: |
  ## [Remove Sub-Folders from the Filesystem](https://leetcode.com/problems/remove-sub-folders-from-the-filesystem) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)
  
  Given a list of folders folder, return *the folders after removing all **sub-folders** in those folders*. You may return the answer in **any order**.
  
  If a folder[i] is located within another folder[j], it is called a **sub-folder** of it. A sub-folder of folder[j] must start with folder[j], followed by a &quot;/&quot;. For example, &quot;/a/b&quot; is a sub-folder of &quot;/a&quot;, but &quot;/b&quot; is not a sub-folder of &quot;/a/b/c&quot;.
  
  The format of a path is one or more concatenated strings of the form: &#39;/&#39; followed by one or more lowercase English letters.
  
  	For example, &quot;/leetcode&quot; and &quot;/leetcode/problems&quot; are valid paths while an empty string and &quot;/&quot; are not.
  
  &nbsp;
  
  Example 1:
  
  ```
  
  **Input:** folder = [\"/a\",\"/a/b\",\"/c/d\",\"/c/d/e\",\"/c/f\"]
  **Output:** [\"/a\",\"/c/d\",\"/c/f\"]
  **Explanation:** Folders \"/a/b\" is a subfolder of \"/a\" and \"/c/d/e\" is inside of folder \"/c/d\" in our filesystem.
  
  ```
  
  Example 2:
  
  ```
  
  **Input:** folder = [\"/a\",\"/a/b/c\",\"/a/b/d\"]
  **Output:** [\"/a\"]
  **Explanation:** Folders \"/a/b/c\" and \"/a/b/d\" will be removed because they are subfolders of \"/a\".
  
  ```
  
  Example 3:
  
  ```
  
  **Input:** folder = [\"/a/b/c\",\"/a/b/ca\",\"/a/b/d\"]
  **Output:** [\"/a/b/c\",\"/a/b/ca\",\"/a/b/d\"]
  
  ```
  
  &nbsp;
  
  **Constraints:**
  
  	1 &lt;= folder.length &lt;= 4 * 104
  	2 &lt;= folder[i].length &lt;= 100
  	folder[i] contains only lowercase letters and &#39;/&#39;.
  	folder[i] always starts with the character &#39;/&#39;.
  	Each folder name is **unique**.
---

```python
class Solution:
    def removeSubfolders(self, folder: List[str]) -> List[str]:
        folder.sort(key=lambda x : len(x))
        mp = set()
        for r in folder:
            f_arr = r.split('/')
            p = ""
            include = True
            for a in f_arr:
                if a == "":
                    continue
                if p + "/" + a in mp:
                    include = False
                    break
                p += "/" + a
            if include:
                mp.add(p)
        return list(mp)





        
```