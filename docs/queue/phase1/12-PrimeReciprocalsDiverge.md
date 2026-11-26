**Slug:** PrimeReciprocalsDiverge
**Tier:** 1 (calibration: in Mathlib as `not_summable_one_div_on_primes`)

### Source statement (quoted exactly)
> The sum of the reciprocals of all prime numbers diverges; that is:
> ∑_{p prime} 1/p = 1/2 + 1/3 + 1/5 + 1/7 + 1/11 + 1/13 + 1/17 + ⋯ = ∞

Reference: Wikipedia, "Divergence of the sum of the reciprocals of the primes" (lead), retrieved 2026-11-26. Freek Wiedijk, *Formalizing 100 Theorems*, item 81. The formula is typeset by Hilbert.

### What Mathlib has
- `not_summable_one_div_on_primes : ¬ Summable (indicator {p | p.Prime} (fun n : ℕ ↦ (1 : ℝ) / n))` in `Mathlib/NumberTheory/SumPrimeReciprocals.lean`.

### Notes for formalizers
"= ∞" means the real partial sums (the sums of 1/p over the primes p ≤ N) grow without bound as N → ∞.
