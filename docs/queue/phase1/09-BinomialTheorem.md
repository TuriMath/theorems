**Slug:** BinomialTheorem
**Tier:** 1 (calibration: in Mathlib as `add_pow`)

### Source statement (quoted exactly)
> According to the theorem, the expansion of any nonnegative integer power n of the binomial x + y is a sum of the form
> (x + y)^n = ∑_{k=0}^{n} C(n, k) x^(n−k) y^k

Reference: Wikipedia, "Binomial theorem", section "Statement", retrieved 2026-11-26. Freek Wiedijk, *Formalizing 100 Theorems*, item 44. The formula is typeset by Hilbert, and C(n, k) is the binomial coefficient "n choose k".

### What Mathlib has
- `add_pow [CommSemiring R] (x y : R) (n : ℕ) : (x + y) ^ n = ∑ k ∈ range (n + 1), x ^ k * y ^ (n - k) * n.choose k` in `Mathlib/Data/Nat/Choose/Sum.lean`. Note that the roles of x and y are swapped relative to the source.
- `Commute.add_pow` for commuting elements of a semiring.

### Notes for formalizers
n is a natural number. x and y are elements of an arbitrary commutative ring `R : Type u` (universe-polymorphic). Do not generalise to semirings, and do not narrow to a specific ring. The coefficients C(n, k) are natural numbers, viewed in that ring.
