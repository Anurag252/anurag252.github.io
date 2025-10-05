---
            title: "417 Pacific Atlantic Water Flow"
            date: "2025-10-05T23:01:49+02:00"
            categories: ["leetcode"]
            tags: [csharp]
            layout: post
---
            
## [Pacific Atlantic Water Flow](https://leetcode.com/problems/pacific-atlantic-water-flow) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

There is an m x n rectangular island that borders both the **Pacific Ocean** and **Atlantic Ocean**. The **Pacific Ocean** touches the island's left and top edges, and the **Atlantic Ocean** touches the island's right and bottom edges.

The island is partitioned into a grid of square cells. You are given an m x n integer matrix heights where heights[r][c] represents the **height above sea level** of the cell at coordinate (r, c).

The island receives a lot of rain, and the rain water can flow to neighboring cells directly north, south, east, and west if the neighboring cell's height is **less than or equal to** the current cell's height. Water can flow from any cell adjacent to an ocean into the ocean.

Return *a **2D list** of grid coordinates *result* where *result[i] = [ri, ci]* denotes that rain water can flow from cell *(ri, ci)* to **both** the Pacific and Atlantic oceans*.

 

Example 1:

![image](https://assets.leetcode.com/uploads/2021/06/08/waterflow-grid.jpg)
```

**Input:** heights = [[1,2,2,3,5],[3,2,3,4,4],[2,4,5,3,1],[6,7,1,4,5],[5,1,1,2,4]]
**Output:** [[0,4],[1,3],[1,4],[2,2],[3,0],[3,1],[4,0]]
**Explanation:** The following cells can flow to the Pacific and Atlantic oceans, as shown below:
[0,4]: [0,4] -> Pacific Ocean 
       [0,4] -> Atlantic Ocean
[1,3]: [1,3] -> [0,3] -> Pacific Ocean 
       [1,3] -> [1,4] -> Atlantic Ocean
[1,4]: [1,4] -> [1,3] -> [0,3] -> Pacific Ocean 
       [1,4] -> Atlantic Ocean
[2,2]: [2,2] -> [1,2] -> [0,2] -> Pacific Ocean 
       [2,2] -> [2,3] -> [2,4] -> Atlantic Ocean
[3,0]: [3,0] -> Pacific Ocean 
       [3,0] -> [4,0] -> Atlantic Ocean
[3,1]: [3,1] -> [3,0] -> Pacific Ocean 
       [3,1] -> [4,1] -> Atlantic Ocean
[4,0]: [4,0] -> Pacific Ocean 
       [4,0] -> Atlantic Ocean
Note that there are other possible paths for these cells to flow to the Pacific and Atlantic oceans.

```

Example 2:

```

**Input:** heights = [[1]]
**Output:** [[0,0]]
**Explanation:** The water can flow from the only cell to the Pacific and Atlantic oceans.

```

 

**Constraints:**

	m == heights.length
	n == heights[r].length
	1 <= m, n <= 200
	0 <= heights[r][c] <= 105

{% raw %}


```csharp


public class Solution {
    public IList<IList<int>> PacificAtlantic(int[][] matrix) {
     
         int n = matrix.Length;
        
         if(n == 0)
        {
            IList<IList<int>> lsa = new List<IList<int>>();
                  
            return lsa;
        }
        
         int m = matrix[0].Length;
         IList<IList<int>> ls = new List<IList<int>>();
        bool[,] pacific = new bool[matrix.Length ,matrix[0].Length];
        bool[,] atlantic = new bool[matrix.Length ,matrix[0].Length];
        int[,] visited = new int[matrix.Length ,matrix[0].Length];
        
              
        
         for(int i = 0 ; i < n ; i++)
        {         
            for(int j = 0 ; j < m ; j++)
            {
                if(i == 0 || j == 0)
                {
                  pacific[i,j] = true;
                }
                
                if(i == n-1 || j == m-1)
                {
                    atlantic[i,j] = true;
                }
            }
             
         }
        
        for(int i = 1 ; i < n ; i++)
        {         
            for(int j = 1 ; j < m ; j++)
            {
               if(visited[i,j] == 0)
               {
                   Calc(matrix , visited , pacific , i , j);
                  
               }
            }
            
        }
         visited = new int[matrix.Length ,matrix[0].Length];
        
         
        
         for(int i = n-1 ; i >= 0 ; i--)
        {         
            for(int j = m-1 ; j >= 0 ; j--)
            {
               if(visited[i,j] == 0)
               {
                   Calc(matrix , visited , atlantic , i , j);
                  
               }
            }
            
        }
        
         for(int i = 0 ; i < n ; i++)
        {         
            for(int j = 0 ; j < m ; j++)
            {
                if(pacific[i,j] == true && atlantic[i,j] == true)
                {
                    List<int> ls1 = new List<int>();
                    ls1.Add(i);
                    ls1.Add(j);
                    ls.Add(ls1);
                }
            }
             
         }
        
        
        return ls;
        
    }
        
         
        public bool Calc(int[][] matrix , int[,] visited , bool[,] ocean , int i , int j)
        {
           
            
            
            if(ocean[i,j])
            {
                return true;
            }
            
           
            
            
            if(i+1 < matrix.Length && visited[i+1,j] == 0)
            {
                   
                if(matrix[i+1][j] <= matrix[i][j])
                { visited[i,j] = 1;
                
                    bool t = Calc(matrix , visited , ocean , i +1 , j);
                    if(t)
                    {
                        
                         visited[i,j] = 0;
                        ocean[i,j] = true;
                       
                        return true;;
                    }
                    visited[i,j] = 0;
                }
            }
            
            
            if(j+1 < matrix[0].Length && visited[i,j+1] == 0)
            {
                   
                if(matrix[i][j+1] <= matrix[i][j])
                { visited[i,j] = 1;
                
                    bool t = Calc(matrix , visited , ocean , i  , j+1);
                    if(t)
                    {
                        visited[i,j] = 0;
                       
                        ocean[i,j] = true;
                        return true;
                    }
                    visited[i,j] = 0;
                }
            }
            
            
            if(i-1 >= 0 && visited[i-1,j] == 0)
            {
                    
                if(matrix[i-1][j] <= matrix[i][j])
                {
                    visited[i,j] = 1;
                 
                    bool t = Calc(matrix , visited , ocean , i -1 , j);
                    if(t)
                    {
                        visited[i,j] = 0;
                      
                        ocean[i,j] = true;
                        return true;
                    }
                    visited[i,j] = 0;
                }
            }
            
            
            
            if(j-1 >= 0 && visited[i,j-1] == 0)
            {
                   
                if(matrix[i][j-1] <= matrix[i][j])
                {
                     visited[i,j] = 1;
                  
                    bool t = Calc(matrix , visited , ocean , i  , j-1);
                    if(t)
                    {
                        visited[i,j] = 0;
                      
                        ocean[i,j] = true;
                        return true;
                    }
                    visited[i,j] = 0;
                }
            }
            
            
            return false;
            
        }
        
    
}
    


{% endraw %}
```
