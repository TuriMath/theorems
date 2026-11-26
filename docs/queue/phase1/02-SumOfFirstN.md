**Slug:** SumOfFirstN
**Tier:** 0 (calibration: in Mathlib as `Finset.sum_range_id_mul_two`)

### Source statement (quoted exactly)
> The triangular numbers are given by the following explicit formulas:
> T_n = n(n+1)/2

where, from the lead, T_n = 1 + 2 + 3 + ⋯ + (n − 1) + n.

Reference: Wikipedia, "Triangular number", section "Formula", retrieved 2026-11-26. The definition T_n = 1 + 2 + ⋯ + n comes from the lead. Freek Wiedijk, *Formalizing 100 Theorems*, item 68 ("Sum of an arithmetic series"). The formulas are typeset by Hilbert; the words are verbatim.

### What Mathlib has
- `Finset.sum_range_id_mul_two (n : ℕ) : (∑ i ∈ range n, i) * 2 = n * (n - 1)` in `Mathlib/Algebra/BigOperators/Intervals.lean`.
- `Finset.sum_range_id (n : ℕ) : ∑ i ∈ range n, i = n * (n - 1) / 2` (same file).
- Both sum over `range n = {0, …, n-1}`, which is shifted by one from the source's 1 + … + n. Mathlib does not state the source form directly.

### Notes for formalizers
n is a natural number. T_n is the sum of the integers from 1 to n, so T_0 = 0. n(n+1) is always even, so n(n+1)/2 is an exact division.
