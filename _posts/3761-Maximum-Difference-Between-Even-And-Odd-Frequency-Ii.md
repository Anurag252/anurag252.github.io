---
title: "./3761 Maximum Difference Between Even And Odd Frequency Ii"
date: "2025-06-11T09:59:59+02:00"
categories: ["leetcode"]
tags: [python]
layout: post
problem_statement: "<h2><a href="https://leetcode.com/problems/maximum-difference-between-even-and-odd-frequency-ii">Maximum Difference Between Even and Odd Frequency II</a></h2> <img src='https://img.shields.io/badge/Difficulty-Hard-red' alt='Difficulty: Hard' /><hr><p>You are given a string <code>s</code> and an integer <code>k</code>. Your task is to find the <strong>maximum</strong> difference between the frequency of <strong>two</strong> characters, <code>freq[a] - freq[b]</code>, in a <span data-keyword="substring">substring</span> <code>subs</code> of <code>s</code>, such that:</p>

<ul>
	<li><code>subs</code> has a size of <strong>at least</strong> <code>k</code>.</li>
	<li>Character <code>a</code> has an <em>odd frequency</em> in <code>subs</code>.</li>
	<li>Character <code>b</code> has an <em>even frequency</em> in <code>subs</code>.</li>
</ul>

<p>Return the <strong>maximum</strong> difference.</p>

<p><strong>Note</strong> that <code>subs</code> can contain more than 2 <strong>distinct</strong> characters.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>

<div class="example-block">
<p><strong>Input:</strong> <span class="example-io">s = &quot;12233&quot;, k = 4</span></p>

<p><strong>Output:</strong> <span class="example-io">-1</span></p>

<p><strong>Explanation:</strong></p>

<p>For the substring <code>&quot;12233&quot;</code>, the frequency of <code>&#39;1&#39;</code> is 1 and the frequency of <code>&#39;3&#39;</code> is 2. The difference is <code>1 - 2 = -1</code>.</p>
</div>

<p><strong class="example">Example 2:</strong></p>

<div class="example-block">
<p><strong>Input:</strong> <span class="example-io">s = &quot;1122211&quot;, k = 3</span></p>

<p><strong>Output:</strong> <span class="example-io">1</span></p>

<p><strong>Explanation:</strong></p>

<p>For the substring <code>&quot;11222&quot;</code>, the frequency of <code>&#39;2&#39;</code> is 3 and the frequency of <code>&#39;1&#39;</code> is 2. The difference is <code>3 - 2 = 1</code>.</p>
</div>

<p><strong class="example">Example 3:</strong></p>

<div class="example-block">
<p><strong>Input:</strong> <span class="example-io">s = &quot;110&quot;, k = 3</span></p>

<p><strong>Output:</strong> <span class="example-io">-1</span></p>
</div>

<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>3 &lt;= s.length &lt;= 3 * 10<sup>4</sup></code></li>
	<li><code>s</code> consists only of digits <code>&#39;0&#39;</code> to <code>&#39;4&#39;</code>.</li>
	<li>The input is generated that at least one substring has a character with an even frequency and a character with an odd frequency.</li>
	<li><code>1 &lt;= k &lt;= s.length</code></li>
</ul>"
---

```python
class Solution:
    def maxDifference(self, s: str, k: int) -> int:
        def getStatus(cnt_a: int, cnt_b: int) -> int:
            return ((cnt_a & 1) << 1) | (cnt_b & 1)

        n = len(s)
        ans = float("-inf")
        for a in ["0", "1", "2", "3", "4"]:
            for b in ["0", "1", "2", "3", "4"]:
                if a == b:
                    continue

                best = [float("inf")] * 4
                cnt_a = cnt_b = 0
                prev_a = prev_b = 0
                left = -1
                for right in range(n):
                    cnt_a += s[right] == a
                    cnt_b += s[right] == b
                    while right - left >= k and cnt_b - prev_b >= 2:
                        left_status = getStatus(prev_a, prev_b)
                        best[left_status] = min(
                            best[left_status], prev_a - prev_b
                        )
                        left += 1
                        prev_a += s[left] == a
                        prev_b += s[left] == b

                    right_status = getStatus(cnt_a, cnt_b)
                    if best[right_status ^ 0b10] != float("inf"):
                        ans = max(
                            ans, cnt_a - cnt_b - best[right_status ^ 0b10]
                        )

        return ans
```