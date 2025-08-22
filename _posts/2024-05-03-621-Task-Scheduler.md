---
            title: "621 Task Scheduler"
            date: "2024-05-03T23:35:32+02:00"
            categories: ["leetcode"]
            tags: [csharp]
            layout: post
---
            
## [Task Scheduler](https://leetcode.com/problems/task-scheduler) ![image](https://img.shields.io/badge/Difficulty-Medium-orange)

You are given an array of CPU tasks, each represented by letters A to Z, and a cooling time, n. Each cycle or interval allows the completion of one task. Tasks can be completed in any order, but there's a constraint: **identical** tasks must be separated by at least n intervals due to cooling time.

​Return the *minimum number of intervals* required to complete all tasks.

 

Example 1:

<div class="example-block" style="
    border-color: var(--border-tertiary);
    border-left-width: 2px;
    color: var(--text-secondary);
    font-size: .875rem;
    margin-bottom: 1rem;
    margin-top: 1rem;
    overflow: visible;
    padding-left: 1rem;
">

**Input:** <span class="example-io" style="
    font-family: Menlo,sans-serif;
    font-size: 0.85rem;
">tasks = ["A","A","A","B","B","B"], n = 2

**Output:** <span class="example-io" style="
font-family: Menlo,sans-serif;
font-size: 0.85rem;
">8

**Explanation:** A possible sequence is: A -> B -> idle -> A -> B -> idle -> A -> B.

After completing task A, you must wait two cycles before doing A again. The same applies to task B. In the 3rd interval, neither A nor B can be done, so you idle. By the 4th cycle, you can do A again as 2 intervals have passed.

Example 2:

<div class="example-block" style="
    border-color: var(--border-tertiary);
    border-left-width: 2px;
    color: var(--text-secondary);
    font-size: .875rem;
    margin-bottom: 1rem;
    margin-top: 1rem;
    overflow: visible;
    padding-left: 1rem;
">

**Input:** <span class="example-io" style="
    font-family: Menlo,sans-serif;
    font-size: 0.85rem;
">tasks = ["A","C","A","B","D","B"], n = 1

**Output:** <span class="example-io" style="
    font-family: Menlo,sans-serif;
    font-size: 0.85rem;
">6

**Explanation:** A possible sequence is: A -> B -> C -> D -> A -> B.

With a cooling interval of 1, you can repeat a task after just one other task.

Example 3:

<div class="example-block" style="
    border-color: var(--border-tertiary);
    border-left-width: 2px;
    color: var(--text-secondary);
    font-size: .875rem;
    margin-bottom: 1rem;
    margin-top: 1rem;
    overflow: visible;
    padding-left: 1rem;
">

**Input:** <span class="example-io" style="
    font-family: Menlo,sans-serif;
    font-size: 0.85rem;
">tasks = ["A","A","A", "B","B","B"], n = 3

**Output:** <span class="example-io" style="
    font-family: Menlo,sans-serif;
    font-size: 0.85rem;
">10

**Explanation:** A possible sequence is: A -> B -> idle -> idle -> A -> B -> idle -> idle -> A -> B.

There are only two types of tasks, A and B, which need to be separated by 3 intervals. This leads to idling twice between repetitions of these tasks.

 

**Constraints:**

	1 <= tasks.length <= 104
	tasks[i] is an uppercase English letter.
	0 <= n <= 100

{% raw %}


````csharp


public class Solution {
    public int LeastInterval(char[] tasks, int n) {
        SortedList<char , int> dict = new SortedList<char , int>();
        
        for(int i = 0 ; i < tasks.Length ; i ++)
        {
            if(dict.ContainsKey(tasks[i]))
            {
                dict[tasks[i]] = dict[tasks[i]] + 1;
            }
            else
            {
                dict.Add(tasks[i] , 1);
            }
        }
        
        var t  = dict.OrderByDescending(x => x.Value);
        
        int availableSpace = (t.First().Value-1)*n;
        Console.WriteLine(availableSpace);
        Console.WriteLine(t.First().Value);
        for(int i = 1 ; i < t.Count() ; i++)
        {
            
            Console.WriteLine(t.ElementAt(i).Value);
            
            //in case frequency is same as maximum
            availableSpace = availableSpace - Math.Min( t.First().Value-1 ,t.ElementAt(i).Value);
            //Console.WriteLine(availableSpace);
        }
        //what to do if  availableSpace is negative
        availableSpace = Math.Max(availableSpace , 0);
        
        return availableSpace + tasks.Length;
        
        
    }
}


{% endraw %}
