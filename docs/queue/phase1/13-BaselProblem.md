**Slug:** BaselProblem
**Tier:** 1 (calibration: in Mathlib as `hasSum_zeta_two`)

### Source statement (quoted exactly)
> The Basel problem asks for the precise summation of the reciprocals of the squares of the natural numbers, i.e. the precise sum of the infinite series:
> ∑_{n=1}^{∞} 1/n² = 1/1² + 1/2² + 1/3² + ⋯
> … Euler found the exact sum to be π²/6

Reference: Wikipedia, "Basel problem" (lead), retrieved 2026-11-26. Freek Wiedijk, *Formalizing 100 Theorems*, item 14 ("Euler's Summation of 1 + (1/2)^2 + (1/3)^2 + …."). The formulas are typeset by Hilbert.

### What Mathlib has
- `hasSum_zeta_two : HasSum (fun n : ℕ => (1 : ℝ) / (n : ℝ) ^ 2) (π ^ 2 / 6)` in `Mathlib/NumberTheory/ZetaValues.lean`. The sum starts at n = 0, and the 1/0 term is 0 in Lean.

### Notes for formalizers
The claim is that the real series ∑_{n≥1} 1/n² converges, and that its sum is π²/6, where π is the real number pi.
Note for Euler: the ZetaValues imports are heavy.
