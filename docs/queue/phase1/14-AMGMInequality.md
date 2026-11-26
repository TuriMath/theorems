**Slug:** AMGMInequality
**Tier:** 1 (calibration: in Mathlib as `Real.geom_mean_le_arith_mean_weighted`)

### Source statement (quoted exactly)
> In mathematics, the inequality of arithmetic and geometric means, or more briefly the AM–GM inequality, states that the arithmetic mean of a list of non-negative real numbers is greater than or equal to the geometric mean of the same list; and further, that the two means are equal if and only if every number in the list is the same

Reference: Wikipedia, "AM–GM inequality" (lead sentence), retrieved 2026-11-26. Freek Wiedijk, *Formalizing 100 Theorems*, item 38.

### What Mathlib has
- `Real.geom_mean_le_arith_mean_weighted (w z : ι → ℝ) (hw : ∀ i ∈ s, 0 ≤ w i) (hw' : ∑ i ∈ s, w i = 1) (hz : ∀ i ∈ s, 0 ≤ z i) : ∏ i ∈ s, z i ^ w i ≤ ∑ i ∈ s, w i * z i` in `Mathlib/Analysis/MeanInequalities.lean` (the weighted version).
- `Real.geom_mean_le_arith_mean` (weights summing to a positive number), and `Real.geom_mean_eq_arith_mean_weighted_iff_of_pos` (the equality case, weighted, same file). Mathlib has no lemma for the unweighted form itself.

### Notes for formalizers
This is the unweighted version: a list x₁, …, xₙ with n ≥ 1, AM = (x₁ + ⋯ + xₙ)/n, and GM = the non-negative n-th root of x₁⋯xₙ. Both parts are required: the inequality AM ≥ GM, **and** AM = GM if and only if all the xᵢ are equal.
