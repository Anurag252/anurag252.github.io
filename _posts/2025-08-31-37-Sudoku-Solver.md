---
            title: "37 Sudoku Solver"
            date: "2025-08-31T09:34:27+02:00"
            categories: ["leetcode"]
            tags: [csharp]
            layout: post
---
            
## [Sudoku Solver](https://leetcode.com/problems/sudoku-solver) ![image](https://img.shields.io/badge/Difficulty-Hard-red)

Write a program to solve a Sudoku puzzle by filling the empty cells.

A sudoku solution must satisfy **all of the following rules**:

	Each of the digits 1-9 must occur exactly once in each row.
	Each of the digits 1-9 must occur exactly once in each column.
	Each of the digits 1-9 must occur exactly once in each of the 9 3x3 sub-boxes of the grid.

The '.' character indicates empty cells.

 

Example 1:

![image](https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Sudoku-by-L2G-20050714.svg/250px-Sudoku-by-L2G-20050714.svg.png)
```

**Input:** board = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]
**Output:** [["5","3","4","6","7","8","9","1","2"],["6","7","2","1","9","5","3","4","8"],["1","9","8","3","4","2","5","6","7"],["8","5","9","7","6","1","4","2","3"],["4","2","6","8","5","3","7","9","1"],["7","1","3","9","2","4","8","5","6"],["9","6","1","5","3","7","2","8","4"],["2","8","7","4","1","9","6","3","5"],["3","4","5","2","8","6","1","7","9"]]
**Explanation:** The input board is shown above and the only valid solution is shown below:

![image](https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Sudoku-by-L2G-20050714_solution.svg/250px-Sudoku-by-L2G-20050714_solution.svg.png)

```

 

**Constraints:**

	board.length == 9
	board[i].length == 9
	board[i][j] is a digit or '.'.
	It is **guaranteed** that the input board has only one solution.

{% raw %}


```csharp


public class Solution {
    public void SolveSudoku(char[][] board) {
        Calc(board);
    }
    
  public bool  Calc(char[][] board)
    {
        for(int i = 0 ; i < 9 ; i ++)
        {
           for(int j = 0 ; j < 9 ; j ++)
            {
                if(board[i][j] == '.')
                {
                    var ls = findValidList(board , i , j);
                    if(ls.Count > 0)
                    {
                        foreach(var item in ls)
                        {
                            board[i][j] = item.ToString()[0];

                            if(Calc(board))
                            {
                                return true ;
                            }

                        }
                        board[i][j] = '.';
                        return false;
                        //findValidList(board , i , j)
                        
                        
                    }
                    else
                    {
                        return false;
                    }
                    
                }
            } 
        }
      return true;
    }


public List<int> findValidList(char[][] board , int i , int j)
{
    int[] arr = new int[9];
    for(int k = 0 ; k < 9 ; k ++)
    {
        if(board[k][j] != '.')
        {
            arr[Int32.Parse(board[k][j].ToString()) - 1] = 1;
        }
        
        if(board[i][k] != '.')
        {
            //Console.WriteLine(Int32.Parse(board[i][k].ToString()) - 1);
            arr[Int32.Parse(board[i][k].ToString()) - 1] = 1;
        }
                
    }
    
     int k1 = 3*(i / 3) + 2;
         int l = 3*(j / 3) + 2;

         for (int c = 3 * (i / 3); c <= k1; c++)
         {
             for (int x = 3 * (j / 3); x <= l; x++)
             {
                 if (board[c][x] != '.')
                 {
                     arr[Int32.Parse(board[c][x].ToString()) - 1] = 1;
                 }
             }

         }
    
    
    List<int> ls = new List<int>();
    for(int k = 0 ; k < 9 ; k ++)
    {
        if(arr[k] == 0)
        {
            ls.Add(k + 1);
        }
        
    }
    return ls;
}
}


{% endraw %}
```
