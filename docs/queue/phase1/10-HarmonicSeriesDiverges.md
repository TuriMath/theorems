**Slug:** HarmonicSeriesDiverges
**Tier:** 1 (calibration: in Mathlib as `Real.tendsto_sum_range_one_div_nat_succ_atTop`)

### Source statement (quoted exactly)
> In mathematics, the harmonic series is the infinite series formed by summing all positive unit fractions.
> … the harmonic series does not have a finite limit: it is a divergent series.

Reference: Wikipedia, "Harmonic series (mathematics)" (lead), retrieved 2026-11-26. Freek Wiedijk, *Formalizing 100 Theorems*, item 34.

### What Mathlib has
- `Real.tendsto_sum_range_one_div_nat_succ_atTop : Tendsto (fun n => ∑ i ∈ Finset.range n, (1 / (i + 1) : ℝ)) atTop atTop` in `Mathlib/Analysis/PSeries.lean`.
- `Real.not_summable_one_div_natCast : ¬Summable (fun n => 1 / n : ℕ → ℝ)` (same file).

### Notes for formalizers
"All positive unit fractions" means 1/1, 1/2, 1/3, …, so the series is ∑_{n≥1} 1/n. The claim is that the real partial sums 1 + 1/2 + ⋯ + 1/N do not converge to any finite real number as N → ∞.
